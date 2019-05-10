//
//  IntroScreenViewController.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 07/05/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//


import UIKit

class IntroScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let nav = self.navigationController?.navigationBar
        let navConfig = NavigationBarConfigController()
        navConfig.setNavBarTextSize(nav: nav! , stage: Stage.engage)
    }
    
    
    @IBAction func tapCBLNudge(_ sender: UIButton) {
        let url = URL(string: "https://cbl.digitalpromise.org")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
 
}
