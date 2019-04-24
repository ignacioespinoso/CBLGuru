//
//  GuidingQuestionsViewController.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 24/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class ListQuestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    let guidingCell = "GuidingCells"
    public var guidingQuestionList : [(gQuestion : String, gResource : String, gActivity : String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.reloadData()
        
        self.table.tableFooterView = UIView()
        
        table.delegate = self
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.guidingQuestionList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        let cell : UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        if let guidingCell = cell as? MovingGQuestionsCell {
            print(guidingCell.guidingResource.text!)
            guidingCell.guidingResource.sizeToFit()
            guidingCell.onClick()
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell : UITableViewCell =  self.table.dequeueReusableCell(withIdentifier: guidingCell,
                                                                     for: indexPath)
        
        // set the text from the data model
        let guidingList = self.guidingQuestionList
        
        if let guidingCell = cell as? MovingGQuestionsCell {
            guidingCell.guidingQuestion.text = guidingList[indexPath.row].0
            guidingCell.guidingResource.text = guidingList[indexPath.row].1
            guidingCell.guidingActivity.text = guidingList[indexPath.row].2
        }
        
        return cell
    }
}
