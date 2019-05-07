//
//  ProjectSettingsController.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 25/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class ProjectSettingsController: UIViewController {
    @objc var project:ProjectData?
    @IBOutlet weak var projectTitle: UITextField!
    
    @IBOutlet weak var motivation: UITextView!
    @IBOutlet weak var members: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        // call super
        super.viewWillAppear(animated)
        
        // get all seasons
        ProjectServices.getFirstProject { (error, project) in
            if (error == nil && project != nil) {
                // assign project
                self.project = project
                
                OperationQueue.main.addOperation {
                    // setup the ui with new data
                    self.projectTitle.text = project?.name
                    self.members.text = project?.members
                    self.motivation.text = project?.motivation
                }
                
            }
            else {
                print("Unable to find first project")
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        let nav = self.navigationController?.navigationBar
        
        nav?.tintColor = UIColor.white
        nav?.prefersLargeTitles = true
        nav?.backgroundColor = UIColor(red:0.89, green:0.33, blue:0.15, alpha:1.0)
        nav?.barTintColor = UIColor(red:0.89, green:0.33, blue:0.15, alpha:1.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        nav?.largeTitleTextAttributes = textAttributes
    }
    
    

    /// Function to validate input data, creating and saving notifications, and dismissing.
    @IBAction func saveProject(_ sender: UIButton) {
        // in according to the operation, grab information from ui and persist it
        
        if ( self.project != nil ) {
            
            // get information from UI
            self.project!.name = self.projectTitle.text!
            self.project!.members = self.members.text!
            self.project!.motivation = self.motivation.text!
            
            // update the information
            ProjectServices.updateProject(project: self.project!) { error in
                if (error != nil) {
                    // treat error if necessary
                }
            }
        }
        else {
            // initialize a new alarm get information from UI
            self.project = ProjectData()
            self.project!.name = self.projectTitle.text!
            self.project!.members = self.members.text!
            self.project!.motivation = self.motivation.text!
            // create new alarm
            ProjectServices.createProject(project: self.project!) { error in
                if (error != nil) {
                    print("Error creating project")
                    // treat error if necessary
                }
            }
        }
        
        // go back to the Home
        self.navigationController?.popViewController(animated: true)
    }
}
