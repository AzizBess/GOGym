//
//  ExerciceItem.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-30.
//

import SwiftUI

struct ExerciceItemView: View {
    var imageURL: String
    var title: String
    var subtitle: String
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: URL(string: imageURL)) {
                    $0.image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150, alignment: .center)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15.0))

            .padding(.bottom, 15)
            VStack {
                Text(title)
                    .font(.subheadline)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .bold()
                    .foregroundStyle(Color.black.gradient)
                Text(subtitle)
                    .font(.footnote)
                    .foregroundStyle(Color.black.gradient)
            }
            .padding(.horizontal, 5)
        }
    }
}

struct ExerciceItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciceItemView(imageURL: "", title: "", subtitle: "")
    }
}
