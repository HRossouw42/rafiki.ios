//
//  LoginViewController.swift
//  rafiki.ios
//
//  Created by Harmun Rossouw on 2019/12/03.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit
import OAuth2

class LoginViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var titleLabel: UILabel!
    
    // OAUTH TUTORIAL
    // https://github.com/p2/OAuth2#installation

    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field user input through delegate callbacks.
        nameTextField.delegate = self
        passwordTextField.delegate = self
    }

    // MARK: UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide keyboard
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        //titleLabel.text = "Welcome \(nameTextField.text)"
    }

    // MARK: Actions

    @IBAction func pressLoginButton(_ sender: UIButton) {
        print("login button pressed 👍")
        titleLabel.text = "welcome \(nameTextField.text ?? "Guest")"
    }
}
