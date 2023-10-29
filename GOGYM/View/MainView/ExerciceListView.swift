//
//  ContentView.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-27.
//

import SwiftUI

struct ExerciceListView: View {
    @ObservedObject var viewModel: ExerciceListViewModel
    var body: some View {
        List {
            BodyPartBannerView(bodyPart: viewModel.bodyPart)
                .padding(.bottom, 10)
                .listRowSeparator(.hidden)
            ForEach(viewModel.exercices, id: \.id, content: { exercice in
                ExerciceItemView(
                    imageURL: exercice.gifURL,
                    title: exercice.name,
                    subtitle: exercice.equipment ?? ""
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .listRowSeparator(.hidden)
            })
            .padding(.horizontal, 16)
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .listRowSeparator(.hidden)
            } else {
                if !viewModel.exercices.isEmpty {
                    Color.clear
                        .listRowSeparator(.hidden)
                        .onAppear {
                            print("End Of List")
                            viewModel.loadMore()
                        }
                }
            }
        }
        .padding(.horizontal, -20)
        .listStyle(.plain)
        .onAppear {
            if viewModel.exercices.isEmpty {
                viewModel.fetchExerciceByBodyPart()
            }
        }
        .navigationTitle("All \(viewModel.bodyPart.name) Exercices")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciceListView(viewModel: ExerciceListViewModel(exercices: [], bodyPart: .chest))
    }
}
