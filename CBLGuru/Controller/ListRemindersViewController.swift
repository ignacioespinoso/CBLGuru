//
//  ListRemindersViewController.swift
//  CBLGuru
//
//  Created by Gabriel Ferreira on 09/05/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class ListRemindersViewController: UITableViewController {
    fileprivate var reminders: [RemindersData] = []
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // call super
        super.viewWillAppear(animated)
        
        print(self.reminders)

        // get all seasons
        RemindersServices.getAllProjects { (error, reminders) in
            if (error == nil) {
                // assign season list
                self.reminders = reminders!
                
                // reload table view with season information
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            }
            else {
                // display error here because it was not possible to load season list
                print("Error retrieving content")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check for the correct transition
        if (segue.identifier == "addOrEditReminder") {
            // cast destination controller and setup initial data
            let destinationViewController:AddReminderViewController = segue.destination as! AddReminderViewController
            destinationViewController.navigationItem.title = (sender is RemindersData) ? "Edit Reminder" : "Add Reminder"
            destinationViewController.reminder = sender as? RemindersData
        }
    }
}

extension ListRemindersViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reminders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get a new cell
        let cell:RemindersTableViewCell = table.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath) as! RemindersTableViewCell
        
        // fill cell with extracted information
        cell.reminderName.text = self.reminders[indexPath.row].name
        var date = self.reminders[indexPath.row].date
        date?.addTimeInterval(Double(TimeZone.current.secondsFromGMT()))
        cell.reminderDate.text = date?.description
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String? {
        return "Reminders already created:"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addOrEditReminder", sender: self.reminders[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // get season that will be deleted
            let reminder : RemindersData = self.reminders[indexPath.row]
            
            // remove season from database
            RemindersServices.deleteProject(reminders: reminder) { (error) in
                if ( error == nil ) {
                    // remove element from array
                    self.reminders.remove(at: indexPath.row)
                    
                    // remove element from table view
                    self.table.deleteRows(at: [indexPath], with: .fade)
                }
                else {
                    // manage a possible problem to remove the item from database
                }
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(self.reminders)
    }

}
