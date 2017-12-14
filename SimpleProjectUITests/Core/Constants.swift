//
//  Constants.swift
//  Gaia
//
//  Created by Sergey Komarov on 6/5/17.
//  Copyright © 2017 Gaiam TV. All rights reserved.
//

import Foundation
import UIKit
import XCTest

class Constants {
    
    public static let CountryCode = (Locale.current as NSLocale).object(forKey: NSLocale.Key.countryCode) as? String ?? "US"
    public static let LanguageCode = (Locale.current as NSLocale).object(forKey: NSLocale.Key.languageCode) as? String ?? "en"
    static var currentDevice: String {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return "iPhone"
        case .pad:
            return "iPad"
        case .tv:
            return "Apple_TV"
        case .carPlay:
            return "Car_Play"
        default:
            return "Unknown_Device"
        }
    }
}

struct Platform {
    static let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
            isSim = true
        #endif
        return isSim
    }()
}

extension Set {
    public func randomObject() -> Element? {
        let n = Int(arc4random_uniform(UInt32(self.count)))
        let index = self.index(self.startIndex, offsetBy: n)
        return self.count > 0 ? self[index] : nil
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, bundle: Bundle.init(for: Constants.self), comment: "")
    }
}

extension XCUIElement {
    /**
     Removes any current text in the field before typing in the new value
     - Parameter text: the text to enter into the field
     */
    public func clearAndTypeText(_ text: String) -> Void {
        self.tap()
        let stringValue = self.value as? String ?? ""
        let deleteString = Array(stringValue).map { _ in XCUIKeyboardKey.delete.rawValue }.joined(separator: "")
        self.typeText(deleteString)
        self.typeText(text)
        self.typeText(XCUIKeyboardKey.return.rawValue)
    }
    
    /*
     Waiting for element appears
     - Parameter timeout: time in seconds
     */
    @discardableResult
    public func waitUntilAppears(timeout: TimeInterval) -> Bool {
        let predicate = NSPredicate(format: "isHittable == true")
        let expect = XCTestCase().expectation(for: predicate, evaluatedWith: self)
        return XCTWaiter().wait(for: [expect], timeout: timeout) == .completed
    }
    
    @discardableResult
    public func waitUntilExistsWithResult(timeout: TimeInterval) -> XCTWaiter.Result {
        let predicate = NSPredicate(format: "exists == true")
        let expect = XCTestCase().expectation(for: predicate, evaluatedWith: self)
        return  XCTWaiter().wait(for: [expect], timeout: timeout)
    }
    
    @discardableResult
    public func waitUntilAppearsWithResult(timeout: TimeInterval) -> XCTWaiter.Result {
        let predicate = NSPredicate(format: "isHittable == true")
        let expect = XCTestCase().expectation(for: predicate, evaluatedWith: self)
        return XCTWaiter().wait(for: [expect], timeout: timeout)
    }
    
    /**
     Waiting for element disppears
     - Parameter timeout: time in seconds
     */
    @discardableResult
    public func waitUntilDisappears(timeout: TimeInterval) -> Bool {
        let predicate = NSPredicate(format: "isHittable == false")
        let expect = XCTestCase().expectation(for: predicate, evaluatedWith: self)
        return XCTWaiter().wait(for: [expect], timeout: timeout) == .completed
    }
    
    @discardableResult
    public func waitUntilDisappearsWithResult(timeout: TimeInterval) -> XCTWaiter.Result {
        let predicate = NSPredicate(format: "exists == false")
        let expect = XCTestCase().expectation(for: predicate, evaluatedWith: self)
        return  XCTWaiter().wait(for: [expect], timeout: timeout)
    }
    
    /**
     Scroll untill the element is visible
     */
    @discardableResult
    func scrollToElement(timeout: TimeInterval = 30) -> XCUIElement {
        let start = Date()
        while !self.visible() {
            let startPoint = XCUIApplication().coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.2))
            let finishPoint = XCUIApplication().coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0))
            startPoint.press(forDuration:0, thenDragTo: finishPoint)
            if Date() > (start + timeout) {
                XCTFail("Impossible to find element within \(timeout) second")
                break
            }
        }
        return self
    }
    
    /**
     Check that element within a screen window
     */
    public func visible() -> Bool {
        guard self.exists && !self.frame.isEmpty else { return false }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }
    
    /**
     Tap on the element using coordinates instead of standard tap() func
     */
    public func forceTap() {
        self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0)).tap()
    }
    
    /**
     Usefull for elements that not support isSelected property.
     Required to add accessibilityValue = "selected" for such elements.
     */
    public var isElementSelected: Bool {
        return "selected" == String(describing: self.value ?? "")
    }
    
    /**
     Checking whether a video inside element is running
     */
    func isVideoRunningInside() -> Bool {
        var result = false
        XCTContext.runActivity(named: "Checking video is running inside the element") { (activity) in
            var screenshots = [self.screenshot()]
            sleep(1)
            screenshots.append(self.screenshot())
            sleep(1)
            screenshots.append(self.screenshot())
            let attachments = screenshots.map { XCTAttachment(screenshot: $0) }
            for attachment in attachments {
                attachment.lifetime = .keepAlways
                activity.add(attachment)
            }
            result = screenshots[0].pngRepresentation != screenshots[1].pngRepresentation &&
                screenshots[1].pngRepresentation != screenshots[2].pngRepresentation
        }
        return result
    }
}
