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
                        .frame(width: 200, height: 200, alignment: .center)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15.0))

            .padding(.vertical, 15)
            Text(title)
                .font(.title3)
                .lineLimit(1)
                .bold()
                .foregroundStyle(Color.black.gradient)
            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(Color.black.gradient)
        }
    }
}

struct ExerciceItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciceItemView(imageURL: "", title: "", subtitle: "")
    }
}
