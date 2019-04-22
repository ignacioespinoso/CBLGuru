//
//  EngageData.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 22/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class EngageData: NSObject {
    public private(set) var bigIdea: String
    public private(set) var essentialQuestion: String
    public private(set) var challenge: String
    
    public override init() {
        self.bigIdea = ""
        self.essentialQuestion = ""
        self.challenge = ""
    }
    
    public func setBigIdea(newBigIdea: String) {
        self.bigIdea = newBigIdea
    }
    
    public func setEssentialQuestion(newEssentialQuestion: String) {
        self.bigIdea = newEssentialQuestion
    }
    
    public func setChallenge(newChallenge: String) {
        self.bigIdea = newChallenge
    }
}
