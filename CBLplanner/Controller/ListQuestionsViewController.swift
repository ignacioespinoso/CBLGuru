//
//  GuidingQuestionsViewController.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 24/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class ListQuestionsViewController: UIViewController {
    fileprivate var guidings: [GuidingData] = []
    @IBOutlet weak var table: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        // call super
        super.viewWillAppear(animated)
        
        // get all seasons
        GuidingServices.getAllProjects { (error, guidings) in
            if (error == nil) {
                // assign season list
                self.guidings = guidings!
                
                // reload table view with season information
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            }
            else {
                // display error here because it was not possible to load season list
                print("Error retrieving content")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check for the correct transition
        if (segue.identifier == "addOrEditGuiding") {
            // cast destination controller and setup initial data
            let destinationViewController:AddGuidingQuestionsViewController = segue.destination as! AddGuidingQuestionsViewController
            destinationViewController.navigationItem.title = (sender is GuidingData) ? "Edit Guiding" : "Add Guiding"
            destinationViewController.guiding = sender as? GuidingData
        }
    }
}
    
extension ListQuestionsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.guidings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get a new cell
        let cell:GuidingTableViewCell = table.dequeueReusableCell(withIdentifier: "GuidingCells", for: indexPath) as! GuidingTableViewCell
        
        // get the season data to be displayed
        if let guiding:GuidingData = self.guidings[indexPath.row] {
            // fill cell with extracted information
            cell.questionLabel.text = guiding.question
            cell.resourceLabel.text = guiding.resource
            cell.activityLabel.text = guiding.activity
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addOrEditGuiding", sender: self.guidings[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // get season that will be deleted
            let guiding:GuidingData = self.guidings[indexPath.row]
            
            // remove season from database
            GuidingServices.deleteProject(guiding:guiding) { (error) in
                if ( error == nil ) {
                    // remove element from array
                    self.guidings.remove(at: indexPath.row)
                    
                    // remove element from table view
                    self.table.deleteRows(at: [indexPath], with: .fade)
                }
                else {
                    // manage a possible problem to remove the item from database
                }
            }
        }
    }
    
}

    
    
    
    
    
    
    
    
    
    
