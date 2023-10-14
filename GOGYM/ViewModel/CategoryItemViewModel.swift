//
//  CategoryItemViewModel.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-14.
//

import SwiftUI
import Combine

class CategoryItemViewModel: ObservableObject {
    @Published var exercices = Exercices()
    @Published var hasMore: Bool = false
    let limit: Int
    let bodyPart: BodyPart
    private var bag = Set<AnyCancellable>()

    init(bodyPart: BodyPart, limit: Int = 10) {
        self.bodyPart = bodyPart
        self.limit = limit
    }

    func fetchExerciceByBodyPart() {
        ExerciceService.shared
            .fetchExercicesByBodyPart(bodyPart, limit: limit)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {_ in }, receiveValue: { [weak self] exercices in
                self?.exercices = exercices
                self?.hasMore = exercices.count == self?.limit
            })
            .store(in: &bag)
    }
}
