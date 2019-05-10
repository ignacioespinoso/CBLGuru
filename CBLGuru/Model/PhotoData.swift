//
//  PhotoData.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 26/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import Foundation
import CoreData

class PhotoData: NSManagedObject {
    
    @NSManaged public var photo: String?
    @NSManaged public var belongs_to_project: ProjectData?
    
    convenience init() {
        // get context
        let managedObjectContext: NSManagedObjectContext = CoreDataManager.sharedInstance.persistentContainer.viewContext
        
        // create entity description
        let entityDescription = NSEntityDescription.entity(forEntityName: "PhotoData", in: managedObjectContext)
        
        // call super
        self.init(entity: entityDescription!, insertInto: nil)
    }
    
}
