//
//  GuidingData+CoreDataClass.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//
//

import Foundation
import CoreData

class GuidingData: NSManagedObject {
    
    @NSManaged public var activity: String?
    @NSManaged public var project_id: UUID?
    @NSManaged public var question: String?
    @NSManaged public var resource: String?
    @NSManaged public var belongs_to_project: ProjectData?
    
    convenience init() {
        // get context
        let managedObjectContext: NSManagedObjectContext = CoreDataManager.sharedInstance.persistentContainer.viewContext
        
        // create entity description
        let entityDescription = NSEntityDescription.entity(forEntityName: "GuidingData", in: managedObjectContext)
        
        // call super
        self.init(entity: entityDescription!, insertInto: nil)
    }

}
