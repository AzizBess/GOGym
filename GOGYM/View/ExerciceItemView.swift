//
//  ExerciceItem.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-30.
//

import SwiftUI

struct ExerciceItemView: View {
    var exercice: Exercice
    var body: some View {
        VStack {
            Image(systemName: "dumbbell")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(exercice.name)
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Text(exercice.target.uppercased())
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                
                Spacer()
            }
            .padding()
        }
        .padding([.top, .horizontal])
//        .frame(width: 300, height: 300, alignment: .center)
        .background(
            LinearGradient(gradient: Gradient(colors: [.brown, .gray, .white]), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(30)
    }
}

struct ExerciceItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciceItemView(exercice: Exercice(bodyPart: "", equipment: "", gifURL: "", id: "", name: "Test Exercice", target: "test", secondaryMuscles: [], instructions: []))
    }
}
