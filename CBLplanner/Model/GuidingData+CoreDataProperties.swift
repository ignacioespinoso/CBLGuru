//
//  GuidingData+CoreDataProperties.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//
//

import Foundation
import CoreData


extension GuidingData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GuidingData> {
        return NSFetchRequest<GuidingData>(entityName: "GuidingData")
    }

    @NSManaged public var guidingQuestion: String?
    @NSManaged public var guidingResource: String?
    @NSManaged public var guidingActivity: String?
    @NSManaged public var belongs_to_project: Engage?

}
