//
//  ViewController.swift
//  SimpleProject
//
//  Created by Сергей Комаров on 11/15/17.
//  Copyright © 2017 Gaia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userEmailField: UITextField!
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameField.delegate = self
        userEmailField.delegate = self
        error.text = ""
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameField.resignFirstResponder()
        userEmailField.resignFirstResponder()
        return true
    }
    
    //MARK: Actions
    @IBAction func sentRequest(_ sender: UIButton) {
        let name = userNameField.text
        let email = userEmailField.text
        guard name != "" else {
            error.text = "Please enter your name"
            return
        }
        guard email != "" else {
            error.text = "Please enter your email"
            return
        }
        error.text = "\(name!) has succesfully registered"
        error.textColor = UIColor(red: 0.0, green: 0.6, blue: 0.3, alpha: 1.0)
    }
    
}
