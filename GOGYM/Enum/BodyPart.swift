//
//  BodyPart.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-28.
//

import Foundation

enum BodyPart: String, CaseIterable {
    case back
    case cardio
    case chest
    case lowerArms
    case lowerLegs
    case neck
    case shoulders
    case upperArms
    case upperLegs
    case waist
    
    var imageName: String {
        self.rawValue
    }
    
    var logoName: String {
        "bp-" + self.rawValue
    }
}
