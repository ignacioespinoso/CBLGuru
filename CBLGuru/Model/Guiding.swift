//
//  Guiding.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 24/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit
import CoreData

class Guiding: NSManagedObject {
    
    @NSManaged public var guidingQuestion: String?
    @NSManaged public var guidingResource: String?
    @NSManaged public var guidingActivity: String?
    
    convenience init() {
        // get context
        let managedObjectContext: NSManagedObjectContext = CoreDataManager.sharedInstance.persistentContainer.viewContext
        
        // create entity description
        let entityDescription = NSEntityDescription.entity(forEntityName: "Guiding", in: managedObjectContext)
        
        // call super
        self.init(entity: entityDescription!, insertInto: nil)
    }
}
