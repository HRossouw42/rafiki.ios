//
//  Account.swift
//  rafiki.ios
//
//  Created by Harmun Rossouw on 2019/12/04.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import Foundation

class Account {
    // MARK: Properties
    
    var name: String
    var balance: Double
    
    // MARK: Initialization
    
    init?(name: String, balance: Double) {
        if name.isEmpty || balance.isNaN {
            return nil
        }
        
        self.name = name
        self.balance = balance
    }
}
