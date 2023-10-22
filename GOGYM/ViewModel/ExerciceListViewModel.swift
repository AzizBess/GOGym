//
//  HomeViewModel.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-27.
//

import Foundation
import Combine

class ExerciceListViewModel: ObservableObject {
    @Published private(set) var exercices = Exercices()
    @Published private(set) var isLoading = false
//    @Published var hasError = false
    var bodyPart: BodyPart
    private var bag = Set<AnyCancellable>()
    private var offset = 0
    private let limit = 20
    
    init(exercices: Exercices, bodyPart: BodyPart) {
        self.exercices = exercices
        self.bodyPart = bodyPart
    }
    
    func fetchExerciceByBodyPart() {
        ExerciceService.shared
            .fetchExercicesByBodyPart(bodyPart, limit: limit, offset: offset)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {_ in }, receiveValue: { [weak self] exercices in
                guard !exercices.isEmpty else { return }
                self?.exercices.append(contentsOf: exercices)
                self?.isLoading = false
            })
            .store(in: &bag)
    }
    
    func loadMore() {
        isLoading = true
        offset += limit
        print("## LOADING MORE | offset = \(offset), limit = \(limit)")
        fetchExerciceByBodyPart()
    }
}
