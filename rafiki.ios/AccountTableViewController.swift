//
//  AccountTableViewController.swift
//  rafiki.ios
//
//  Created by Harmun Rossouw on 2019/12/04.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController {
    // MARK: Properties

    var accounts = [Account]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load sample data
        loadSampleAccounts()
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

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
     }
     */

    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
             // Delete the row from the data source
             tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
             // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
     }
     */

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

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */

    // MARK: Private Methods

    private func loadSampleAccounts() {
        guard let account1 = Account(name: "Cheque", balance: 1000.10) else {
            fatalError("Unable to instantiate account1")
        }

        guard let account2 = Account(name: "Savings", balance: 5000.511) else {
            fatalError("Unable to instantiate account1")
        }

        guard let account3 = Account(name: "Student Loans", balance: -9000.1) else {
            fatalError("Unable to instantiate account1")
        }

        accounts += [account1, account2, account3]
    }
}
