//
//  LinkToNudgeViewController.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 25/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class LinkToNudgeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapCBLNudge(_ sender: UIButton) {
        let url = URL(string: "itms-apps://itunes.apple.com/us/app/cbl-nudge/id1403826548?mt=8")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    
}
