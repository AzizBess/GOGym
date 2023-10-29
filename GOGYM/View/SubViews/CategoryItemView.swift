//
//  CategoryItemView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-12.
//

import SwiftUI
import Combine

struct CategoryItemView: View {
    @ObservedObject var viewModel: CategoryItemViewModel
    var body: some View {
        VStack(spacing: 5.0) {
            CategoryHeaderView(
                viewModel: viewModel,
                image: viewModel.bodyPart.logoName,
                title: "\(viewModel.bodyPart.name.capitalized) Exercices",
                hasMore: viewModel.hasMore
            )

            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.exercices, id: \.id) { exercice in
                        NavigationLink(destination: ExerciceDetailView(viewModel: ExerciceDetailViewModel(exercice: exercice))) {
                            ExerciceCardView(
                                imageURL: exercice.gifURL,
                                title: exercice.name,
                                subtitle: exercice.equipment ?? ""
                            )
                            .frame(minHeight: 250, alignment: .center)
                            .containerRelativeFrame(.horizontal,
                                                    count: 2,
                                                    spacing: 0.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                            )
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(8, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
        }
        .onAppear(perform: {
            viewModel.fetchExerciceByBodyPart()
        })

    }
}

#Preview {
    CategoryItemView(viewModel: CategoryItemViewModel(bodyPart: .chest))
}

public extension Color {

    static func random(randomOpacity: Bool = false, opacity: Double = 1) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : opacity
        )
    }
}
