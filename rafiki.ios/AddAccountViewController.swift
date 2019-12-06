//
//  AddAccountViewController.swift
//  rafiki.ios
//
//  Created by Harmun Rossouw on 2019/12/05.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import os.log
import UIKit

class AddAccountViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var balanceTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    /*
     This value is either passed by `AccountTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var account: Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // do something
    }
    
    // MARK: Navigation
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure denstination view controller only when save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
    }
    
    // MARK: Actions
}
