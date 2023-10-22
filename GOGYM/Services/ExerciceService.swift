//
//  ExerciceService.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-29.
//

import Foundation
import Combine

class ExerciceService {
    static var shared = ExerciceService()
    func fetchAllExercices() -> AnyPublisher<Exercices, Error> {
        // CREATING PUBLISHER
        return APIManager.shared.callAPI(.allExercices, limit: 10)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func fetchExercicesByBodyPart(_ bodyPart: BodyPart, limit: Int, offset: Int = 0) -> AnyPublisher<Exercices, Error> {
        return APIManager.shared.callAPI(
            .exercicesByBodyPart(bodyPart: bodyPart.apiValue),
            limit: limit,
            offset: offset
        )
        .map(\.value)
        .eraseToAnyPublisher()
    }
}
