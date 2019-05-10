//
//  EngageController.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 22/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class EngageController: UIViewController {

    @IBOutlet weak var challenge: UITextField!
    @IBOutlet weak var essentialQuestion: UITextField!
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
    
    @IBAction func saveEssentialQuestion(_ sender: UIButton) {
        if let value = essentialQuestion.text {
            self.engageData.setEssentialQuestion(newEssentialQuestion: value)
        }
    }
    
    @IBAction func saveChallenge(_ sender: UIButton) {
        if let value =  challenge.text {
            self.engageData.setChallenge(newChallenge: value)
        }
    }
    
    
    @IBAction func tapCBLNudge(_ sender: UIButton) {
        let url = URL(string: "https://itunes.apple.com/us/app/cbl-nudge/id1403826548?mt=8")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
