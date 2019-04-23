//
//  bigIdeaController.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class bigIdeaController: UIViewController {

    @IBOutlet weak var bigIdea: UITextField!
    
    fileprivate let engageData = EngageData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBigIdea(_ sender: UIButton) {
        if let value = bigIdea.text {
            self.engageData.setBigIdea(newBigIdea: value)
        }
    }
    
    @IBAction func tapCBLNudge(_ sender: UIButton) {
        let url = URL(string: "https://itunes.apple.com/us/app/cbl-nudge/id1403826548?mt=8")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    

}
