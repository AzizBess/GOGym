//
//  ExerciceDetailView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-26.
//

import SwiftUI

class ExerciceDetailViewModel: ObservableObject {
    let exercice: Exercice
    
    init(exercice: Exercice) {
        self.exercice = exercice
    }
}

struct ExerciceDetailView: View {
    @ObservedObject var viewModel: ExerciceDetailViewModel
    
    var body: some View {
        ScrollView {
            GIFImage(source: .remote(url: URL(string: viewModel.exercice.gifURL)!))
                .clipShape(
                    UnevenRoundedRectangle(
                        cornerRadii: RectangleCornerRadii(
                            topLeading: 20,
                            bottomLeading: 0,
                            bottomTrailing: 0,
                            topTrailing: 20
                        )
                    )
                )
                .padding(.horizontal, 4)
            Text(viewModel.exercice.name.capitalized)
                .font(.title)
                .bold()
                .fontDesign(.rounded)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            VStack(spacing: 0) {
                horizontalView(image: viewModel.exercice.target, title: "Target:", value: viewModel.exercice.target.capitalized)
                
                horizontalView(image: "equipment", title: "Equipment:", value: (viewModel.exercice.equipment ?? "").capitalized)
                
                horizontalView(image: "other", title: "Seconday Muscles:", value: viewModel.exercice.secondaryMuscles.map({ $0.capitalized }).joined(separator: " | "))
            }
            .background(Color(red: 250, green: 250, blue: 250))
            
            Text("Instructions")
                .font(.title)
                .bold()
                .fontDesign(.rounded)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            ForEach((0...viewModel.exercice.instructions.count - 1), id: \.self) { index in
                ZStack {
                    Color.white
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    VStack {
                        Text("Step \(index + 1)")
                            .bold()
                        Text(viewModel.exercice.instructions[index])
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.gray)
                )
                .padding(.horizontal, 10)
            }
            
        }
        .background(Color.gray.opacity(0.15))
        .navigationTitle(viewModel.exercice.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func horizontalView(image: String, title: String, value: String) -> some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                .aspectRatio(contentMode: .fit)
                .padding(5)
                .clipShape(
                    Circle()
                )
            
            Text(title)
                .lineLimit(1)
                .font(.caption)
                .bold()
                .foregroundStyle(Color.black.gradient)
            Text(value)
                .lineLimit(1)
                .font(.caption)
                .foregroundStyle(Color.black.gradient)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 8)
    }
}

#Preview {
    ExerciceDetailView(viewModel: ExerciceDetailViewModel(exercice: Exercice(
        bodyPart: "chest",
        equipment: "body weight",
        gifURL: "https://v2.exercisedb.io/image/MsraK1iC2zNG4l",
        id: "3294",
        name: "archer push up",
        target: "pectorals",
        secondaryMuscles: ["triceps", "shoulders", "core"],
        instructions: [
            "Start in a push-up position with your hands slightly wider than shoulder-width apart.",
            "Extend one arm straight out to the side, parallel to the ground.",
            "Lower your body by bending your elbows, keeping your back straight and core engaged.",
            "Push back up to the starting position.",
            "Repeat on the other side, extending the opposite arm out to the side.",
            "Continue alternating sides for the desired number of repetitions."
        ]
    )))
}
