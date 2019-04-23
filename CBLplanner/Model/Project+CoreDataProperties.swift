//
//  Project+CoreDataProperties.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var name: String?
    @NSManaged public var bigIdea: String?
    @NSManaged public var essentialQuestion: String?
    @NSManaged public var challenge: String?
    @NSManaged public var fluxogram_pic: NSData?
    @NSManaged public var investigate_synthesis: String?
    @NSManaged public var has_guiding_data: GuidingData?

}
