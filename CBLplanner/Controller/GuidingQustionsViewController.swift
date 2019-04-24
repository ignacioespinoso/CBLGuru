//
//  InvestigateViewController.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 22/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class GuidingQustionsViewController: UIViewController {
    @IBOutlet weak var gQuestionsTextField: UITextField!
    @IBOutlet weak var gResourcesTextField: UITextField!
    @IBOutlet weak var gActivitiesTextField: UITextView!
    public var guidingQuestionList : [(gQuestion : String, gResource : String, gActivity : String)] = []

    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        if  let gQuestion = self.gQuestionsTextField.text,
            let gResource = self.gResourcesTextField.text,
            let gActivity = self.gActivitiesTextField.text,
            gQuestion != "" {
            
            //Update list is the list with the new item
            let _ = guidingQuestionList.append((gQuestion: gQuestion, gResource: gResource, gActivity: gActivity))
            
        }
        
//        self.table.reloadData()
        
        //Make the textFields empty
        gQuestionsTextField.text = ""
        gResourcesTextField.text = ""
        gActivitiesTextField.text = ""
    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.guidingQuestionList.count
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You tapped cell number \(indexPath.row).")
//        let cell : UITableViewCell = tableView.cellForRow(at: indexPath)!
//
//        if let guidingCell = cell as? MovingGQuestionsCell {
//            print(guidingCell.guidingResource.text!)
//            guidingCell.guidingResource.sizeToFit()
//            guidingCell.onClick()
//            tableView.reloadRows(at: [indexPath], with: .automatic)
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // create a new cell if needed or reuse an old one
//       let cell : UITableViewCell =  self.table.dequeueReusableCell(withIdentifier: guidingCell,
//                                                                     for: indexPath)
//
//        // set the text from the data model
//        let guidingList = self.guidingQuestionList
//
//        if let guidingCell = cell as? MovingGQuestionsCell {
//            guidingCell.guidingQuestion.text = guidingList[indexPath.row].0
//            guidingCell.guidingResource.text = guidingList[indexPath.row].1
//            guidingCell.guidingActivity.text = guidingList[indexPath.row].2
//        }
//
//        return cell
//    }
    
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        table.estimatedRowHeight = 120
//        table.rowHeight = UITableView.automaticDimension
//    }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layoutcollectionViewLayout:  UICollectionViewLayout,
//                        sizeForItemAtIndexPath: IndexPath) -> CGSize {
//
//        let approximateWidthOfActivityText = 296
//        let size = CGSize(width: approximateWidthOfActivityText, height: 1000)
//        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
//
//        let estimatedFrame = NSString(string: gActivitiesTextField.text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
//
//
//        return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
//    }
    
    
}
