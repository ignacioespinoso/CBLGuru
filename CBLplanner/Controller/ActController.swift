//
//  ActController.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 25/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class ActController: UIViewController {
    
    @objc var project:ProjectData?
    
    @IBOutlet weak var actTextView: UITextView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var chooseBuuton: UIButton!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        imagePicker.delegate = self
        
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.white
        nav?.prefersLargeTitles = true
        nav?.backgroundColor = UIColor(red:0.89, green:0.33, blue:0.15, alpha:1.0)
        nav?.barTintColor = UIColor(red:0.12, green:0.53, blue:0.60, alpha:1.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        nav?.largeTitleTextAttributes = textAttributes
    }

    override func viewWillAppear(_ animated: Bool) {
        // call super
        super.viewWillAppear(animated)
        
        // get all seasons
        ProjectServices.getFirstProject { (error, project) in
            if (error == nil) {
                // assign project
                self.project = project
                
                OperationQueue.main.addOperation {
                    // setup the ui with new data
                    if(project != nil && project!.fluxogramPic != nil) {
                        let imageLoaded: UIImage? = UIImage(data: project!.fluxogramPic!)
                        self.imageView.image = imageLoaded
                        self.chooseBuuton.isHidden = true
                    }
                    self.actTextView.text = project?.act
                    
                }
                
            }
            else {
                print("Unable to find first project")
            }
        }
        
    }
    
    @IBAction func onClickPickImage(_sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    /// Function to validate input data, creating and saving notifications, and dismissing.
    @IBAction func savePressed(_ sender: UIButton) {
        if ( self.project != nil ) {
            
            // get information from UI
            if(imageView.image != nil) {
                let data : Data? = imageView.image!.pngData()!
                self.project!.fluxogramPic = data
            }
            
            self.project!.act = actTextView.text

            
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
            
            if(imageView.image != nil) {
                let data : Data? = imageView.image!.pngData()!
                self.project!.fluxogramPic = data
            }
            self.project!.act = actTextView.text
            
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

extension ActController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey  : Any]){
        
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
            chooseBuuton.isHidden = true
        }
        dismiss(animated: true, completion: nil)
        
    }
}
