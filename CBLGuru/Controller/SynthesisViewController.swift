//
//  SythesisViewController.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class SynthesisViewController: UIViewController {
    
    @objc var project:ProjectData?
    
    @IBOutlet weak var synthesisTextView: UITextView!
    
    
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
                    self.synthesisTextView.text = project?.investigate_synthesis
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
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        if ( self.project != nil ) {
            
            // get information from UI
            self.project!.investigate_synthesis = self.synthesisTextView.text!
            
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
            self.project!.investigate_synthesis = self.synthesisTextView.text!
            
            //            DO I NEED TO INITIALIZE OTHER ELEMENTS AS WELL?
            
            // create new alarm
            ProjectServices.createProject(project: self.project!) { error in
                if (error != nil) {
                    print("Error creating project")
                    // treat error if necessary
                }
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
  
    
}
