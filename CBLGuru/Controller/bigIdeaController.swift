//
//  bigIdeaController.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class bigIdeaController: UIViewController {
    /// Project to be stored in case of updating operation
    @objc var project:ProjectData?
    
    @IBOutlet weak var bigIdea: UITextField!
    
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
                    self.bigIdea.text = project?.bigIdea
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
        
        // Sets navigation bar according to this step corresponding color
        let nav = self.navigationController?.navigationBar
        
        nav?.tintColor = UIColor.white
        nav?.prefersLargeTitles = true
        nav?.backgroundColor = UIColor(red:0.89, green:0.33, blue:0.15, alpha:1.0)
        nav?.barTintColor = UIColor(red:0.89, green:0.33, blue:0.15, alpha:1.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        nav?.largeTitleTextAttributes = textAttributes
    }
    
    @IBAction func tapCBLNudge(_ sender: UIButton) {
        let url = URL(string: "itms-apps://itunes.apple.com/us/app/cbl-nudge/id1403826548?mt=8")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    /// Function to validate input data, creating and saving notifications, and dismissing.
    @IBAction func saveProject(_ sender: UIButton) {
        // in according to the operation, grab information from ui and persist it
        
        if ( self.project != nil ) {
            
            // get information from UI
            self.project!.bigIdea = self.bigIdea.text!
            
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
            self.project!.bigIdea = self.bigIdea.text!
            
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
