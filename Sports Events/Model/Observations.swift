//
//  SportsEvents.swift
//  Sports Events
//
//  Created by Dale Musser on 11/7/18.
//  Copyright © 2018 Tech Innovator. All rights reserved.
//

import Foundation

enum Classification: String, Codable {
    case bird
    case amphibian
    case reptile
    case insect
    case fish
    case plant
    case mammal
}

struct Observation: Codable {
    var classification: Classification
    var title: String
    var description: String
    var date: Date
}

struct Observations: Codable {
    var status: String
    var observations: [Observation]
}
