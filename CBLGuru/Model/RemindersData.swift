//
//  RemindersData.swift
//  CBLGuru
//
//  Created by Gabriel Ferreira on 09/05/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import Foundation
import CoreData

class RemindersData: NSManagedObject {
    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    
    convenience init() {
        // get context
        let managedObjectContext: NSManagedObjectContext = CoreDataManager.sharedInstance.persistentContainer.viewContext
        
        // create entity description
        let entityDescription = NSEntityDescription.entity(forEntityName: "RemindersData", in: managedObjectContext)
        
        // call super
        self.init(entity: entityDescription!, insertInto: nil)
    }
}
