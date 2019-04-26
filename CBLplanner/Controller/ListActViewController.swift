//
//  ListActViewController.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 26/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class ListActViewController: UIViewController {
    fileprivate var photos: [PhotoData] = []
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        
        let nav = self.navigationController?.navigationBar
        
        // 2
        nav?.tintColor = UIColor.white
        nav?.prefersLargeTitles = true
        nav?.backgroundColor = UIColor(red:0.89, green:0.33, blue:0.15, alpha:1.0)
        nav?.barTintColor = UIColor(red:0.67, green:0.81, blue:0.11, alpha:1.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        nav?.largeTitleTextAttributes = textAttributes
        nav?.titleTextAttributes = textAttributes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // call super
        super.viewWillAppear(animated)
        
        // get all seasons
        PhotoServices.getAllProjects { (error, photos) in
            if (error == nil) {
                // assign season list
                self.photos = photos!
                
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
        if (segue.identifier == "addOrEditPhoto") {
            // cast destination controller and setup initial data
            let destinationViewController:AddPhotoViewController = segue.destination as! AddPhotoViewController
            destinationViewController.navigationItem.title = (sender is GuidingData) ? "Edit Photo" : "Add Photo"
            destinationViewController.photo = sender as? PhotoData
        }
    }
}

extension ListActViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get a new cell
        let cell:ActTableViewCell = table.dequeueReusableCell(withIdentifier: "ActCells", for: indexPath) as! ActTableViewCell
        
        // get the season data to be displayed
        if let photo:PhotoData = self.photos[indexPath.row] {
            // fill cell with extracted information
            cell.descriptionLabel.text = photo.description
            cell.photo.accessibilityIdentifier = photo.photo
           
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String? {
        return "Imagens já adicionadas:"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addOrEditPhoto", sender: self.photos[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // get season that will be deleted
            let photo:PhotoData = self.photos[indexPath.row]
            
            // remove season from database
            PhotoServices.deleteProject(photo:photo) { (error) in
                if ( error == nil ) {
                    // remove element from array
                    self.photos.remove(at: indexPath.row)
                    
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
