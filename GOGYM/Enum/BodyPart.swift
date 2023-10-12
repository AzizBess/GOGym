//
//  BodyPart.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-28.
//

import Foundation

enum BodyPart: String, CaseIterable {
    case back // done
    case cardio // done
    case chest // done
    case lowerArms // done
    case lowerLegs // done
    case neck // done
    case shoulders // done
    case upperArms // done
    case upperLegs // done
    case waist // done
    
    var imageName: String {
        self.rawValue
    }
}
