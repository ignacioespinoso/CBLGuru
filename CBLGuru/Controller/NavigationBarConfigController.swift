//
//  LinkToCBLInstituteViewController.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 08/05/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit
import Foundation

class NavigationBarConfigController {

    func setNavBarColor (nav: UINavigationBar, stage: Stage ) {
        switch stage {
        case .engage:
            nav.barTintColor = UIColor(red:0.89, green:0.33, blue:0.15, alpha:1.0)
        case .investigate:
            nav.barTintColor = UIColor(red:0.67, green:0.81, blue:0.11, alpha:1.0)
        case .act:
            nav.barTintColor = UIColor(red:0.12, green:0.53, blue:0.60, alpha:1.0)
        }
    }

    func setNavBarTextSize(nav: UINavigationBar, stage: Stage) {
        nav.tintColor = UIColor.white
        nav.prefersLargeTitles = true
        nav.backgroundColor = UIColor(red:0.89, green:0.33, blue:0.15, alpha:1.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        nav.largeTitleTextAttributes = textAttributes
        setNavBarColor(nav: nav, stage: stage)
    }

}
