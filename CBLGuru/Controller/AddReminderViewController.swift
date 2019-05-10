//
//  AddReminderViewController.swift
//  CBLGuru
//
//  Created by Gabriel Ferreira on 09/05/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit
import EventKit

class AddReminderViewController: UIViewController {
    @objc var reminder : RemindersData?
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    //var tableView : UITableView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let thisReminder : RemindersData = self.reminder {
            self.name.text = thisReminder.name
            self.date.date = thisReminder.date!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveReminder(_ sender: UIButton) {
        let eventStore = EKEventStore();
        
        
        let name = self.name.text
        let date = self.date.date
        
        eventStore.requestAccess(to: .event, completion: { (granted, error) in
            if (granted) && (error == nil){
                let event = EKEvent(eventStore: eventStore)
                event.title = name
                event.startDate = date
                event.endDate = date
                event.addAlarm(EKAlarm(relativeOffset: 0))
                event.calendar = eventStore.defaultCalendarForNewEvents
                //event.addObserver(<#T##observer: NSObject##NSObject#>, forKeyPath: <#T##String#>, options: <#T##NSKeyValueObservingOptions#>, context: <#T##UnsafeMutableRawPointer?#>)
                
                do {
                    try eventStore.save(event, span: .thisEvent)
                    
                } catch let error as NSError{
                    print("error \(error)")
                }
            } else {
                print("error \(String(describing: error))")
            }
        })
        
        if ( self.reminder != nil ) {
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
            self.reminder!.name = self.name.text
            self.reminder!.date = self.date.date

            // create new alarm
            RemindersServices.createProject(reminders: self.reminder!) { error in
                if (error != nil) {
                    // treat error if necessary
                }
            }
            print(reminder!.date)
        }

        // go back to the alarm list
        self.navigationController?.popViewController(animated: true)
    }
}
