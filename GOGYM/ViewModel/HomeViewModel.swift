//
//  HomeViewModel.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-27.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published private(set) var exercices = Exercices()
    @Published private(set) var isRefreshing = false
    @Published var hasError = false
    @Published var error = NSError()
    private var bag = Set<AnyCancellable>()
    
    func fetchExerciceDataSubscriber() {
        ExerciceService.shared
            .fetchAllExercices()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {_ in }, receiveValue: { [weak self] exercices in
                self?.exercices = exercices
            })
            .store(in: &bag)
    }
}
