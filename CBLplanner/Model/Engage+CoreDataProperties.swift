//
//  Engage+CoreDataProperties.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//
//

import Foundation
import CoreData


extension Engage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Engage> {
        return NSFetchRequest<Engage>(entityName: "Project")
    }

    @NSManaged public var bigIdea: String?
    @NSManaged public var challenge: String?
    @NSManaged public var essentialQuestion: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var fluxogram_pic: NSData?
    @NSManaged public var synthesis: String?

}
