//
//  User.swift
//  rafiki.ios
//
//  Created by Harmun Rossouw on 2019/12/03.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class User {
    //MARK: Properties
    
    var name: String
    var password: String
    
    //MARK: Initialization
    
    init?(name:String, password:String) {
        if name.isEmpty || password.isEmpty {
            return nil
        }
        
        self.name = name
        self.password = password
    }
}
