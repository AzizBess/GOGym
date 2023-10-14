//
//  BodyPart.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-28.
//

import Foundation

enum BodyPart: String, CaseIterable {
    
    case chest
    case back
    case waist
    case shoulders
    case upperArms
    case upperLegs
    case lowerArms
    case lowerLegs
    case cardio
    case neck
    
    var imageName: String {
        rawValue
    }
    
    var logoName: String {
        "bp-" + rawValue
    }
    
    var name: String {
        switch self {
        case .lowerArms:
            return "forearms".capitalized
        case .lowerLegs:
            return "calves".capitalized
        case.upperArms:
            return "arms".capitalized
        case .upperLegs:
            return "legs".capitalized
        case .waist:
            return "abs".capitalized
        default:
            return rawValue.capitalized
        }
    }
    
    var apiValue: String {
        switch self {
        case .lowerArms:
            return "lower arms"
        case .lowerLegs:
            return "lower legs"
        case.upperArms:
            return "upper arms"
        case .upperLegs:
            return "upper legs"
        default:
            return rawValue
        }
    }
}
