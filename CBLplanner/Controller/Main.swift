//
//  ViewController.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 18/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class Main: UIViewController {

    @IBOutlet weak var nav_toolbar: UIToolbar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Sets navigation bar according to this step corresponding color
        let nav = self.navigationController?.navigationBar
        
        nav?.tintColor = UIColor.white
        nav?.prefersLargeTitles = true
        nav?.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        nav?.barTintColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        nav?.largeTitleTextAttributes = textAttributes
    }


}

