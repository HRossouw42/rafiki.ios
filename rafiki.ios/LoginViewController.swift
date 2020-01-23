//
//  LoginViewController.swift
//  rafiki.ios
//
//  Created by Harmun Rossouw on 2019/12/03.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

//import AppAuth
import OAuth2
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
//    let oauth2 = OAuth2CodeGrant(settings: [
//        "client_id": "app-client",
//        "client_secret": "test-secret",
//        "authorize_uri": "https://auth.mojaloop.app/oauth2/auth",
//        "token_uri": "https://auth.mojaloop.app/oauth2/token",
//        "redirect_uris": ["com.example.app:/oauth2/callback"],
//        "scope": "openid",
//        //"secret_in_body": true,    // Github needs this
//        "keychain": false,         // if you DON'T want keychain integration
//    ] as OAuth2JSON)
//
//
//    let base = URL(string: "auth.mojaloop.app")!
//    let url = base.appendingPathComponent("user")
//
//    var req = oauth2.request(forURL: url)
//    req.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
//
//    self.loader = OAuth2DataLoader(oauth2: oauth2)
//    loader.perform(request: req) { response in
//        do {
//            let dict = try response.responseJSON()
//            DispatchQueue.main.async {
//                // you have received `dict` JSON data!
//            }
//        }
//        catch let error {
//            DispatchQueue.main.async {
//                // an error occurred
//            }
//        }
//    }
    
    var loader: OAuth2DataLoader?
    
    let oauth2 = OAuth2ImplicitGrant(settings: [
        "client_id": "app-client",
        "client_secret": "test-secret",
        "authorize_uri": "https://auth.mojaloop.app/oauth2/auth",
        "token_uri": "https://auth.mojaloop.app/oauth2/token",
        "redirect_uris": "com.example.app:/oauth2/callback",
        "scope": "openid",
        //"secret_in_body": true,    // Github needs this
        "keychain": false,         // if you DON'T want keychain integration
    ] as OAuth2JSON)

//    private var authState: OIDAuthState?
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var authorizeButton: UIButton!
    
    // Authorisation service
    //let authService = AuthService()
    
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
        /*
        authService.authorize(from: self, onSuccess: { [weak self] _ in
            self?.authorizeButton.isHidden = true
            self?.loginButton.isHidden = false
        }, onError: { error in
            print(error)
        })
        */
        
        /*
        oauth2.logger = OAuth2DebugLogger(.trace)
        let base = URL(string: "https://mojaloop.app")!
        let url = base.appendingPathComponent("/users/me")

        var req = oauth2.request(forURL: url)
//        req.setValue("https://auth.mojaloop.app/oauth2/token", forHTTPHeaderField: "Accept")
        let loader = OAuth2DataLoader(oauth2: oauth2)
        loader.perform(request: req) { response in
            do {
                let dict = try response.responseJSON()
                DispatchQueue.main.async {
                    // Received JSON data
                    print("Request: \(req)")
                    print("JSON data: \(dict)")
                }
            }
            catch let error {
                DispatchQueue.main.async {
                    // an error occurred
                    print(error)
                }
            }
        }
 */
        
        oauth2.authorize { (callback, error) in
            <#code#>
        }
    }
 
}
