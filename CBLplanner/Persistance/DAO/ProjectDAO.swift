//
//  EngageDAO.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit
import CoreData

class ProjectDAO: DAO {
    
    /// Method responsible for saving a project into database
    /// - parameters:
    ///     - objectToBeSaved: project to be saved on database
    /// - throws: if an error occurs during saving an object into database (Errors.DatabaseFailure)
    static func create(_ objectToBeSaved: ProjectData) throws {
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
    
    /// Method responsible for updating a project into database
    /// - parameters:
    ///     - objectToBeUpdated: project to be updated on database
    /// - throws: if an error occurs during updating an object into database (Errors.DatabaseFailure)
    static func update(_ objectToBeUpdated: ProjectData) throws {
        do {
            // persist changes at the context
            try CoreDataManager.sharedInstance.persistentContainer.viewContext.save()
        }
        catch {
            throw Errors.DatabaseFailure
        }
    }
    
    /// Method responsible for deleting a project from database
    /// - parameters:
    ///     - objectToBeSaved: project to be saved on database
    /// - throws: if an error occurs during deleting an object into database (Errors.DatabaseFailure)
    static func delete(_ objectToBeDeleted: ProjectData) throws {
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
    
    /// Method responsible for retrieving all projects from database
    /// - returns: a list of projects from database
    /// - throws: if an error occurs during getting an object from database (Errors.DatabaseFailure)
    static func findAll() throws -> [ProjectData] {
        // list of projects to be returned
        var projectList:[ProjectData]
        
        do {
            // creating fetch request
            let request:NSFetchRequest<ProjectData> = fetchRequest()
            
            // perform search
            projectList = try CoreDataManager.sharedInstance.persistentContainer.viewContext.fetch(request)
        }
        catch {
            throw Errors.DatabaseFailure
        }
        
        return projectList
    }
}
