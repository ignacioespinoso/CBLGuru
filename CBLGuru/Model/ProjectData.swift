//
//  Project+CoreDataClass.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//
//

import Foundation
import CoreData

class ProjectData: NSManagedObject {
    
    @NSManaged public var name: String?
    @NSManaged public var bigIdea: String?
    @NSManaged public var essentialQuestion: String?
    @NSManaged public var challenge: String?
    @NSManaged public var fluxogramPic: Data?
    @NSManaged public var members: String?
    @NSManaged public var motivation: String?
    @NSManaged public var investigate_synthesis: String?
    @NSManaged public var act: String?
    @NSManaged public var has_guiding_data: GuidingData?
    
    convenience init() {
        // get context
        let managedObjectContext: NSManagedObjectContext = CoreDataManager.sharedInstance.persistentContainer.viewContext
        
        // create entity description
        let entityDescription = NSEntityDescription.entity(forEntityName: "ProjectData", in: managedObjectContext)
        
        // call super
        self.init(entity: entityDescription!, insertInto: nil)
    }
    
}
