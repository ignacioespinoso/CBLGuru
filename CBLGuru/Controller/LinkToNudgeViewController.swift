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
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.white
        nav?.prefersLargeTitles = true
        nav?.backgroundColor = UIColor(red:0.89, green:0.33, blue:0.15, alpha:1.0)
        nav?.barTintColor = UIColor(red:0.12, green:0.53, blue:0.60, alpha:1.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        nav?.largeTitleTextAttributes = textAttributes
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @IBAction func tapCBLNudge(_ sender: UIButton) {
        let url = URL(string: "itms-apps://itunes.apple.com/us/app/cbl-nudge/id1403826548?mt=8")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
}
