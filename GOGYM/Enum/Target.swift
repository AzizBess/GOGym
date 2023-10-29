//
//  Target.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-28.
//

import Foundation
import SwiftUI

enum Target: Codable {
    case abductors
    case abs
    case obliques
    case adductors
    case biceps
    case calves
    case cardiovascularSystem
    case delts
    case forearms
    case glutes
    case hamstrings
    case lats
    case levatorScapulae
    case pectorals
    case quads
    case serratusAnterior
    case spine
    case traps
    case triceps
    case upperBack
    case unknown(_: RawValue)
}

extension Target {
    var logoName: String {
        switch self {
        case .abs: return "abdominal"
        case .adductors: return "pelvis"
        case .cardiovascularSystem: return "heart"
        case .levatorScapulae: return "levatorScapulae"
        case .serratusAnterior: return "serratusAnterior"
        case .delts: return "shoulder"
        case .quads: return "quadricep"
        case .traps: return "trapezius"
        case .upperBack: return "back"
        default: return rawValue.lowercased()
        }
    }
}

extension Target: RawRepresentable {
    var rawValue: String {
        switch self {
        case .abductors: return "abductors"
        case .abs: return "abs"
        case .obliques: return "obliques"
        case .adductors: return "adductors"
        case .biceps: return "biceps"
        case .calves: return "calves"
        case .cardiovascularSystem: return "cardiovascular system"
        case .delts: return "delts"
        case .forearms: return "forearms"
        case .glutes: return "glutes"
        case .hamstrings: return "hamstrings"
        case .lats: return "lats"
        case .levatorScapulae: return "levator scapulae"
        case .pectorals: return "pectorals"
        case .quads: return "quads"
        case .serratusAnterior: return "serratus anterior"
        case .spine: return "spine"
        case .traps: return "traps"
        case .triceps: return "triceps"
        case .upperBack: return "upper back"
        case .unknown(let rawValue): return rawValue
        }
    }
    
    typealias RawValue = String
    
    init?(rawValue: String) {
        switch rawValue {
        case "abductors": self = .abductors
        case "abs": self = .abs
        case "obliques": self = .obliques
        case "adductors": self = .adductors
        case "biceps": self = .biceps
        case "calves": self = .calves
        case "cardiovascular system": self = .cardiovascularSystem
        case "delts": self = .delts
        case "forearms": self = .forearms
        case "glutes": self = .glutes
        case "hamstrings": self = .hamstrings
        case "lats": self = .lats
        case "levator scapulae": self = .levatorScapulae
        case "pectorals": self = .pectorals
        case "quads": self = .quads
        case "serratus anterior": self = .serratusAnterior
        case "spine": self = .spine
        case "traps": self = .traps
        case "triceps": self = .triceps
        case "upper back": self = .upperBack
        default: self = .unknown(rawValue)
        }
    }
}
