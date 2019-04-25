//
//  ActController.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 25/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class ActController: UIViewController {
    
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
    
    /// Function to validate input data, creating and saving notifications, and dismissing.
    @IBAction func saveProject(_ sender: UIButton) {
        // in according to the operation, grab information from ui and persist it
        
        // go back to the Home
        self.navigationController?.popViewController(animated: true)
    }
    
}
