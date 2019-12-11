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
        
        //Handle the text field's user input through delegate callbsacks
        nameTextField.delegate = self
        
        //Set up views if editing an existing Account
        if let account = account {
            navigationItem.title = account.name
            nameTextField.text = account.name
            balanceTextField.text = String(account.balance)
        }
        
        // Enable the Save button only if the text field has a valid input
        updateSaveButton()
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable Save button while editing
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        updateSaveButton()
        navigationItem.title = textField.text
    }
    
    // MARK: Navigation

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in 2 different ways
        let isPresentingInAddAccountMode = presentingViewController is UINavigationController
        
        if isPresentingInAddAccountMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The AddAccountViewController is not inside a navigation Controller")
        }
       
    }
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure denstination view controller only when save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        let balance = Double(balanceTextField.text ?? "")
        
        //Set the account to be passed to AccountTableController after the unwind segue
        account = Account(name: name, balance: balance ?? 0)
    }
    
    // MARK: Private Methods
    
    private func updateSaveButton() {
        //Disables Save button if Name text field is emtpy
        let textName = nameTextField.text ?? ""
        
        saveButton.isEnabled = !textName.isEmpty
    }
}
