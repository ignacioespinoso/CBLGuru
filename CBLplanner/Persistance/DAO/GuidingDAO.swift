//
//  EngageDAO.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit
import CoreData

class GuidingDAO: DAO {
    
    /// Method responsible for saving a guiding data into database
    /// - parameters:
    ///     - objectToBeSaved: guiding data to be saved on database
    /// - throws: if an error occurs during saving an object into database (Errors.DatabaseFailure)
    static func create(_ objectToBeSaved: GuidingData) throws {
        do {
            // add object to be saved to the context
            CoreDataManager.sharedInstance.persistentContainer.viewContext.insert(objectToBeSaved)
            
            // persist changes at the context
            try CoreDataManager.sharedInstance.persistentContainer.viewContext.save()
        }
        catch {
            throw Errors.DatabaseFailure
        }
    }
    
    /// Method responsible for updating a guiding data into database
    /// - parameters:
    ///     - objectToBeUpdated: guiding data to be updated on database
    /// - throws: if an error occurs during updating an object into database (Errors.DatabaseFailure)
    static func update(_ objectToBeUpdated: GuidingData) throws {
        do {
            // persist changes at the context
            try CoreDataManager.sharedInstance.persistentContainer.viewContext.save()
        }
        catch {
            throw Errors.DatabaseFailure
        }
    }
    
    /// Method responsible for deleting a guiding data from database
    /// - parameters:
    ///     - objectToBeSaved: guiding data to be saved on database
    /// - throws: if an error occurs during deleting an object into database (Errors.DatabaseFailure)
    static func delete(_ objectToBeDeleted: GuidingData) throws {
        do {
            // delete element from context
            CoreDataManager.sharedInstance.persistentContainer.viewContext.delete(objectToBeDeleted)
            
            // persist the operation
            try CoreDataManager.sharedInstance.persistentContainer.viewContext.save()
        }
        catch {
            throw Errors.DatabaseFailure
        }
    }
    
    /// Method responsible for retrieving all guiding data from database
    /// - returns: a list of guiding data from database
    /// - throws: if an error occurs during getting an object from database (Errors.DatabaseFailure)
    static func findAll() throws -> [GuidingData] {
        // list of guiding data to be returned
        var guidingList:[GuidingData]
        
        do {
            // creating fetch request
            let request:NSFetchRequest<GuidingData> = fetchRequest()
            
            // perform search
            guidingList = try CoreDataManager.sharedInstance.persistentContainer.viewContext.fetch(request)
        }
        catch {
            throw Errors.DatabaseFailure
        }
        
        return guidingList
    }
}
