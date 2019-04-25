//
//  SythesisViewController.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class SynthesisViewController: UIViewController {
    
    @IBOutlet weak var synthesisTextView: UITextView!
    var synthesis: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        self.synthesis = synthesisTextView.text
    }
    
}
