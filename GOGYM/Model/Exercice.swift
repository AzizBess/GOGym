// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let exercices = try? JSONDecoder().decode(Exercices.self, from: jsonData)

import Foundation

// MARK: - Exercice
struct Exercice: Codable {
    var bodyPart: String
    var equipment: String?
    var gifURL: String
    var id, name: String
    var target: Target
    let secondaryMuscles, instructions: [String]
    
    enum CodingKeys: String, CodingKey {
        case bodyPart, equipment
        case gifURL = "gifUrl"
        case id, name, target, secondaryMuscles, instructions
    }
}

//enum Equipment: String, Codable {
//    case bodyWeight = "body weight"
//    case cable = "cable"
//}

typealias Exercices = [Exercice]
