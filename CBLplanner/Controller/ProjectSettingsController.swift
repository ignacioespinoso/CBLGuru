//
//  ProjectSettingsController.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 25/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class ProjectSettingsController: UIViewController {
    
    @IBOutlet weak var projectTitle: UITextField!
    
    @IBOutlet weak var motivation: UITextView!
    @IBOutlet weak var members: UITextField!
    @IBOutlet weak var notes: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        
        let nav = self.navigationController?.navigationBar
        
        // 2
        nav?.tintColor = UIColor.white
        nav?.prefersLargeTitles = true
        nav?.backgroundColor = UIColor(red:0.89, green:0.33, blue:0.15, alpha:1.0)
        nav?.barTintColor = UIColor(red:0.89, green:0.33, blue:0.15, alpha:1.0)
//        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        nav?.largeTitleTextAttributes = textAttributes
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.black
        nav?.backgroundColor = UIColor.white
        nav?.prefersLargeTitles = false
        nav?.isTranslucent = true
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        nav?.largeTitleTextAttributes = textAttributes
    }
 

}
