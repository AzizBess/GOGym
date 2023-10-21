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
        ScrollView(.vertical) {
            BannerView(bodyPart: viewModel.bodyPart)
            ForEach(viewModel.exercices, id: \.id, content: { exercice in
                VerticalExerciceItemView(
                    imageURL: exercice.gifURL, title: exercice.name, subtitle: exercice.equipment ?? ""
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 16)
            })
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciceListView(viewModel: ExerciceListViewModel(exercices: [], bodyPart: .chest))
    }
}
