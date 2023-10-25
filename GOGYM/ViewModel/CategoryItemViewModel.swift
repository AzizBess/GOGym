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
    private let limit = 10
    let bodyPart: BodyPart
    private var bag = Set<AnyCancellable>()

    init(bodyPart: BodyPart) {
        self.bodyPart = bodyPart
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
