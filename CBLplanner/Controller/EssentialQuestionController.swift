//
//  EssentialQuestionController.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class EssentialQuestionController: UIViewController {


    @IBOutlet weak var essentialQuestion: UITextField!
    
    
    fileprivate let engageData = EngageData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveEssentialQuestion(_ sender: UIButton) {
        if let value = essentialQuestion.text {
            self.engageData.setEssentialQuestion(newEssentialQuestion: value)
        }
    }
    
    
    
    @IBAction func tapCBLNudge(_ sender: UIButton) {
        let url = URL(string: "https://itunes.apple.com/us/app/cbl-nudge/id1403826548?mt=8")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

}
