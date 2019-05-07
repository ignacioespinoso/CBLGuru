//
//  AddActViewController.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 26/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class AddActViewController: UIViewController {
    @objc var photo:PhotoData?
    
    @IBOutlet weak var photoImage: UIImage!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.description.text = photo?.description
        self.photoImage.images = photo?.photo
        
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.darkGray.cgColor
        border.borderWidth = width
        border.frame = CGRect(x: 0, y: gActivitiesTextField.frame.size.height - width, width: gActivitiesTextField.frame.size.width, height: gActivitiesTextField.frame.size.height)
        gActivitiesTextField.layer.addSublayer(border)
        gActivitiesTextField.layer.masksToBounds = true
        
        
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
