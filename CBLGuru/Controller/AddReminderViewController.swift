//
//  AddReminderViewController.swift
//  CBLGuru
//
//  Created by Gabriel Ferreira on 09/05/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class AddReminderViewController: UIViewController {
    @objc var reminder : RemindersData?
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var date: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func saveReminder(_ sender: UIButton) {
        // TODO: check if the form was correctly fullfilled
        // in according to the operation, grab information from ui and persist it
        if ( self.reminder != nil ) {
            print("nem fodendo")
            // get information from UI
            self.reminder!.name = self.name.text!
            self.reminder!.date = self.date.date
            
            
            // update the information
            
            RemindersServices.updateProject(reminders: self.reminder!) { error in
                if (error != nil) {
                    // treat error if necessary
                }
            }
        }
        else {
            // initialize a new alarm get information from UI
            self.reminder = RemindersData()
            self.reminder!.name = self.name.text!
            self.reminder!.date = self.date.date
            
            // create new alarm
            RemindersServices.updateProject(reminders: self.reminder!) { error in
                if (error != nil) {
                    // treat error if necessary
                }
            }
        }
        
        // go back to the alarm list
        self.navigationController?.popViewController(animated: true)
    }
}
