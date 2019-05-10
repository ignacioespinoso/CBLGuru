//
//  ListRemindersViewController.swift
//  CBLGuru
//
//  Created by Gabriel Ferreira on 09/05/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class ListRemindersViewController: UIViewController {
//    fileprivate var reminders: [RemindersData] = []
//    @IBOutlet weak var table: UITableView!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.hideKeyboardWhenTappedAround()
//        // 1
//        
//        let nav = self.navigationController?.navigationBar
//        
//        // 2
//        nav?.tintColor = UIColor.white
//        nav?.prefersLargeTitles = true
//        nav?.backgroundColor = UIColor(red:0.89, green:0.33, blue:0.15, alpha:1.0)
//        nav?.barTintColor = UIColor(red:0.67, green:0.81, blue:0.11, alpha:1.0)
//        //        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
//        nav?.largeTitleTextAttributes = textAttributes
//        nav?.titleTextAttributes = textAttributes
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        // call super
//        super.viewWillAppear(animated)
//        
//        // get all seasons
//        RemindersServices.getAllProjects { (error, reminders) in
//            if (error == nil) {
//                // assign season list
//                self.reminders = reminders!
//                
//                // reload table view with season information
//                DispatchQueue.main.async {
//                    self.table.reloadData()
//                }
//            }
//            else {
//                // display error here because it was not possible to load season list
//                print("Error retrieving content")
//            }
//        }
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // check for the correct transition
//        if (segue.identifier == "addOrEditReminder") {
//            // cast destination controller and setup initial data
//            let destinationViewController:AddReminderViewController = segue.destination as! AddReminderViewController
//            destinationViewController.navigationItem.title = (sender is RemindersData) ? "Edit Reminder" : "Add Reminder"
//            destinationViewController.reminder = sender as? RemindersData
//        }
//    }
//}
//
//extension ListQuestionsViewController: UITableViewDataSource, UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.reminders.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // get a new cell
//        let cell:ReminderTableViewCell = table.dequeueReusableCell(withIdentifier: "ReminderCells", for: indexPath) as! ReminderTableViewCell
//        
//        // get the season data to be displayed
//        if let reminder:RemindersData = self.reminders[indexPath.row] {
//            // fill cell with extracted information
//            cell.questionLabel.text = reminder.question
//            cell.resourceLabel.text = reminder.resource
//            cell.activityLabel.text = reminder.activity
//        }
//        
//        
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String? {
//        return "Reminder questions already created:"
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "addOrEditReminder", sender: self.reminders[indexPath.row])
//    }
//    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if (editingStyle == .delete) {
//            // get season that will be deleted
//            let reminder:ReminderData = self.reminders[indexPath.row]
//            
//            // remove season from database
//            ReminderServices.deleteProject(reminder:reminder) { (error) in
//                if ( error == nil ) {
//                    // remove element from array
//                    self.reminders.remove(at: indexPath.row)
//                    
//                    // remove element from table view
//                    self.table.deleteRows(at: [indexPath], with: .fade)
//                }
//                else {
//                    // manage a possible problem to remove the item from database
//                }
//            }
//        }
//    }

}
