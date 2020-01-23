//
//  AuthService.swift
//  rafiki.ios
//
//  Created by Harmun Rossouw on 2020/01/10.
//  Copyright © 2020 Harmun Rossouw. All rights reserved.
//

import AppAuth
import Foundation

class AuthService {
    // MARK: Properties

    var currentAuthFlow: OIDExternalUserAgentSession?
    private var authState: OIDAuthState?

//    private let authorizationEndpoint = URL(string: "http://localhost:5555")!
//    private let tokenEndpoint = URL(string: "http://localhost:4444")!

    private let authorizationEndpoint = URL(string: "https://auth.mojaloop.app/oauth2/auth")!
    private let tokenEndpoint = URL(string: "https://auth.mojaloop.app/oauth2/token")!
    private lazy var configuration = OIDServiceConfiguration(authorizationEndpoint: authorizationEndpoint, tokenEndpoint: tokenEndpoint)

    private let redirectURI = URL(string: "com.example.app:/oauth2/callback")!
    private let clientID = "app-client"
    private let clientSecret = "test-secret"

    // MARK: Functions

    func authorize(from vc: UIViewController, onSuccess: @escaping (OIDAuthState) -> Void, onError: @escaping (Error) -> Void) {
        // builds authentication request
        let request = OIDAuthorizationRequest(configuration: configuration,
                                              clientId: clientID,
                                              clientSecret: clientSecret,
                                              scopes: [OIDScopeOpenID, "offline"],
                                              redirectURL: redirectURI,
                                              responseType: OIDResponseTypeCode,
                                              additionalParameters: nil)

        // performs authentication request
        print("Initiating authorization request with scope: \(request.scope ?? "nil")")

        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        appDelegate.currentAuthorizationFlow =
            OIDAuthState.authState(byPresenting: request, presenting: vc) { authState, error in
                if let authState = authState {
                    self.authState = authState
                    print("Got authorization tokens. Access token: " +
                        "\(authState.lastTokenResponse?.accessToken ?? "nil")")
                } else {
                    print("Authorization error: \(error?.localizedDescription ?? "Unknown error")")
                    //print(error!)
                    print(request)
                    self.authState = nil
                }
            }
    }
    
}
