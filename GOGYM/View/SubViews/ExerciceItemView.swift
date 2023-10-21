//
//  VerticalExerciceItemView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-19.
//

import SwiftUI

struct ExerciceItemView: View {
    var imageURL: String
    var title: String
    var subtitle: String
    var body: some View {
        HStack {
            ZStack {
                AsyncImage(url: URL(string: imageURL)) {
                    $0.image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90, alignment: .center)
                }
            }
            .padding(.bottom, 15)
            .overlay(
                RoundedRectangle(cornerRadius: 15.0)
                    .stroke(Color.random(), lineWidth: 0.5)
            )
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .lineLimit(2)
                    .bold()
                    .foregroundStyle(Color.black.gradient)
                Text(subtitle)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color.black.gradient)
            }
            .padding(.vertical, 10)
        }
    }
}
#Preview {
    ExerciceItemView(imageURL: "bp-chest", title: "Bench Press", subtitle: "Barbell")
}
