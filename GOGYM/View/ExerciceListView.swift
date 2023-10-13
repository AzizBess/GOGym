//
//  ContentView.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-27.
//

import SwiftUI

struct ExerciceListView: View {
    @ObservedObject var viewModel: HomeViewModel
    var gridItemLayout = [GridItem(.fixed(100.0)), GridItem(.fixed(100.0)), GridItem(.fixed(100.0))]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(viewModel.exercices, id: \.id, content: { exercice in
                        ExerciceItemView(imageURL: exercice.gifURL, title: exercice.name, subtitle: exercice.equipment ?? "")
                    })
                }
            }
            .listStyle(.plain)
            .navigationTitle("Go Gym")
        }
        .onAppear {
            viewModel.fetchExerciceDataSubscriber()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciceListView(viewModel: HomeViewModel())
    }
}
