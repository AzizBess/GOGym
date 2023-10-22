//
//  LoadMoreExampleView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-21.
//

import SwiftUI
import Combine
class LoadMoreExampleViewModel: ObservableObject {
    @Published var exercices = Exercices()
    @Published var isLoading = false
    
    let bodyPart = BodyPart.chest
    let limit = 30
    var offset = 0
    private var bag = Set<AnyCancellable>()
    
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
        print("## Will Load more")
        isLoading = true
        offset += limit
        fetchExerciceByBodyPart()
    }
    
}

struct LoadMoreExampleView: View {
    @StateObject var viewModel: LoadMoreExampleViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.exercices, id: \.id, content: { exercice in
                    Text(exercice.name)
                        .frame(height: 100.0)
                })
                if viewModel.isLoading {
                    ProgressView()
                    progressViewStyle(.circular)
                } else {
                    Color.clear
                        .onAppear {
                            viewModel.loadMore()
                        }
                }
            }
            .listStyle(.plain)
            .navigationTitle("LoadMoreeee")
        }
        .onAppear {
            viewModel.fetchExerciceByBodyPart()
        }
    }
}
