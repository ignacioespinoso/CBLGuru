//
//  IntroEngageViewController.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 09/05/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class IntroEngageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let nav = self.navigationController?.navigationBar
        let navConfig = NavigationBarConfigController()
        navConfig.setNavBarTextSize(nav: nav! , stage: Stage.engage)
    }


}
