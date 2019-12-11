//
//  AccountTableViewController.swift
//  rafiki.ios
//
//  Created by Harmun Rossouw on 2019/12/04.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import os.log
import UIKit

class AccountTableViewController: UITableViewController {
    // MARK: Properties

    var accounts = [Account]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Use edit button item provided by table view controller
        navigationItem.leftBarButtonItem = editButtonItem

        // Load any saved accounts, otherwise load sample data
        if let savedAccounts = loadAccounts() {
            print("saved data found, loading...")
            accounts += savedAccounts
        } else {
            // Load sample data
            print("no saved data exists, loading sample accounts")
            loadSampleAccounts()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "OverviewTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OverviewTableViewCell else {
            fatalError("The dequeued cell is not an instance of OverviewTableViewCell.")
        }

        // Fetches appropriate account for the data source layout
        let account = accounts[indexPath.row]

        cell.nameLabel.text = account.name
        cell.balanceLabel.text = String(account.balance)
        cell.currencyNameLabel.text = "XRP" // FIX: Remove hardcoded currency name

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            accounts.remove(at: indexPath.row)
            saveAccounts()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

     }
     */

    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
     }
     */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        switch segue.identifier ?? "" {
        case "AddItem":
            os_log("Adding a new account.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let addAccountViewController = segue.destination as? AddAccountViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }

            guard let selectedAccountCell = sender as? OverviewTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }

            guard let indexPath = tableView.indexPath(for: selectedAccountCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }

            let selectedAccount = accounts[indexPath.row]
            addAccountViewController.account = selectedAccount

        default:
            fatalError("Unexpected Segue Identifier: \(String(describing: segue.identifier))")
        }
    }

    // MARK: Actions

    @IBAction func unwindToAccountList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddAccountViewController, let account = sourceViewController.account {
            // when selecting a row on the account table

            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing account
                accounts[selectedIndexPath.row] = account
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // Add new account
                let newIndexPath = IndexPath(row: accounts.count, section: 0)

                accounts.append(account)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            // Save the accounts
            saveAccounts()
        }
    }

    // MARK: Private Methods

    private func loadSampleAccounts() {
        guard let account1 = Account(name: "Cheque", balance: 10.1023) else {
            fatalError("Unable to instantiate account1")
        }

        guard let account2 = Account(name: "Savings", balance: 5000.5111) else {
            fatalError("Unable to instantiate account1")
        }

        guard let account3 = Account(name: "Student Loans", balance: 9000.1) else {
            fatalError("Unable to instantiate account1")
        }

        accounts += [account1, account2, account3]
    }

    private func saveAccounts() {
        print("attempting to save accounts")
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(accounts, toFile: Account.ArchiveURL.path)
        // let isSuccesfullSave = try NSKeyedArchiver.archivedData(withRootObject: accounts, requiringSecureCoding: true)
        if isSuccessfulSave {
            os_log("Accounts succesfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save accounts...", log: OSLog.default, type: .error)
        }
    }

    private func loadAccounts() -> [Account]? {
        print("attempting to load accounts")
        return NSKeyedUnarchiver.unarchiveObject(withFile: Account.ArchiveURL.path) as? [Account]
    }
}
