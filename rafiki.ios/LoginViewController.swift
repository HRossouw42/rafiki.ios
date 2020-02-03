//
//  LoginViewController.swift
//  rafiki.ios
//
//  Created by Harmun Rossouw on 2019/12/03.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import OAuthSwift
import SafariServices
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var authorizeButton: UIButton!

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

    @IBAction func authorize(_ sender: Any) {
        // Authorization properties
        let oauthswift = OAuth2Swift(
            consumerKey: "app-client",
            consumerSecret: "test-secret",
            authorizeUrl: "https://auth.mojaloop.app/oauth2/auth",
            accessTokenUrl: "https://auth.mojaloop.app/oauth2token",
            responseType: "token"
        )
//        oauthswift.allowMissingStateCheck = true
        oauthswift.accessTokenBasicAuthentification = true

        // 2
        oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauthswift)

        guard let rwURL = URL(string: "com.example.app:/oauth2/callback") else { return }

        let handle = oauthswift.authorize(
            withCallbackURL: rwURL,
            scope: "openid", state: "MOJALOOP"
        ) { result in
            switch result {
            case .success(let (credential, response, parameters)):
                print("Authentication Success")
                print(credential.oauthToken)
            // Do your request
            case .failure(let error):
                print("Auth Failure")
                print(error.localizedDescription)

            }
        }

//        oauthswift.client.get("https://mojaloop.app/users/me") { result in
//            switch result {
//            case .success(let response):
//                let dataString = response.string
//                print(dataString)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}
