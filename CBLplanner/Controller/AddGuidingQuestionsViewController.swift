//
//  InvestigateViewController.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 22/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class AddGuidingQuestionsViewController: UIViewController {
    @objc var guiding:GuidingData?
    
    @IBOutlet weak var gQuestionsTextField: UITextField!
    @IBOutlet weak var gResourcesTextField: UITextField!
    @IBOutlet weak var gActivitiesTextField: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gQuestionsTextField.text = guiding?.question
        self.gResourcesTextField.text = guiding?.resource
        self.gActivitiesTextField.text = guiding?.activity
    }
    
    /// Function to validate input data, creating and saving notifications, and dismissing.
    @IBAction func saveSeason(_ sender: UIButton) {
        // TODO: check if the form was correctly fullfilled
        // in according to the operation, grab information from ui and persist it
        if ( self.guiding != nil ) {
            // get information from UI
            self.guiding!.question = self.gQuestionsTextField.text!
            self.guiding!.resource = self.gResourcesTextField.text!
            self.guiding!.activity = self.gActivitiesTextField.text!

            
            // update the information
            GuidingServices.updateProject(guiding: self.guiding!) { error in
                if (error != nil) {
                    // treat error if necessary
                }
            }
        }
        else {
            // initialize a new alarm get information from UI
            self.guiding = GuidingData()
            self.guiding!.question = self.gQuestionsTextField.text!
            self.guiding!.resource = self.gResourcesTextField.text!
            self.guiding!.activity = self.gActivitiesTextField.text!
            
            // create new alarm
            GuidingServices.createProject(guiding: self.guiding!) { error in
                if (error != nil) {
                    // treat error if necessary
                }
            }
        }
        
        // go back to the alarm list
        self.navigationController?.popViewController(animated: true)
    }

    
}
