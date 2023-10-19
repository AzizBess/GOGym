//
//  VerticalExerciceItemView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-19.
//

import SwiftUI

struct VerticalExerciceItemView: View {
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
                        .frame(width: 80, height: 80, alignment: .center)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15.0))

            .padding(.bottom, 15)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .lineLimit(2)
//                    .multilineTextAlignment(.leading)
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
    VerticalExerciceItemView(imageURL: "bp-chest", title: "Bench Press", subtitle: "Barbell")
}
