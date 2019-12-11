//
//  Account.swift
//  rafiki.ios
//
//  Created by Harmun Rossouw on 2019/12/04.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import Foundation
import os.log

class Account: NSObject, NSCoding {
    // MARK: Properties
    
    var name: String
    var balance: Double
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("accounts")
    
    // MARK: Initialization
    
    init?(name: String, balance: Double) {
        if name.isEmpty || balance.isNaN {
            return nil
        }
        
        self.name = name
        self.balance = balance
    }
    
    // MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let balance = "balance"
    }
    
    // MARK: NSCoding
    
    // NSCoding protocol declares 2 methods that class must adopt to be encoded and decoded
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropertyKey.name)
        coder.encode(balance, forKey: PropertyKey.balance)
    }
    
    required convenience init?(coder: NSCoder) {
        // name is required. If we cannot decode a name string the initializer must fail
        guard let name = coder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for an Account object", log: OSLog.default, type: .debug)
            return nil
        }
        
        let balance = coder.decodeDouble(forKey: PropertyKey.balance)
        
        // Must call designated initializer
        self.init(name: name, balance: balance)
    }
}
