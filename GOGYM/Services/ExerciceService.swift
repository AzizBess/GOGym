//
//  ExerciceService.swift
//  GoGym
//
//  Created by Hana Salhi on 2023-09-29.
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
}
