//
//  APIMethod.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-28.
//

import Foundation

enum URLPath: RawRepresentable {
    case allExercices
    case exercicesByName(name: String)
    case exerciceById(id: String)
    case exercicesByTarget(target: String)
    case exercicesByEquipement(type: String)
    case exercicesByBodyPart(bodyPart: String)
    case unknown(RawValue)
    
    typealias RawValue = String
    
    init?(rawValue: String) {
        guard let value = rawValue.components(separatedBy: "/").last, !value.isEmpty else {
            self = .unknown(rawValue)
            return
        }
        switch rawValue {
        case "": self = .allExercices
        case let str where str.contains("/name"):
            self = .exercicesByName(name: value)
        case let str where str.contains("/exercise"):
            self = .exerciceById(id: value)
        case let str where str.contains("/target"):
            self = .exercicesByTarget(target: value)
        case let str where str.contains("/equipment"):
            self = .exercicesByEquipement(type: value)
        case let str where str.contains("/bodyPart"):
            self = .exercicesByBodyPart(bodyPart: value)
        default:
            self = .allExercices
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .allExercices: return ""
        case .exercicesByName(let name): return "/name/\(name)"
        case .exerciceById(let id): return "/exercise/\(id)"
        case .exercicesByTarget(let target): return "/target/\(target)"
        case .exercicesByEquipement(let type): return "/equipment/\(type)"
        case .exercicesByBodyPart(let bodyPart): return "/bodyPart/\(bodyPart)"
        case .unknown(let rawValue): return rawValue
        }
    }
}
