//
//  BannerView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-19.
//

import SwiftUI

struct BannerView: View {
    var bodyPart: BodyPart
    var body: some View {
        Image(bodyPart.bannerName)
            .resizable()
            .frame(maxWidth: .infinity, minHeight: 250, maxHeight: 250, alignment: .top)
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            .overlay {
                Text(bodyPart.name + " Exercices")
                    .font(.title).fontWeight(.bold)
                .foregroundStyle(Color.white.gradient)
                .frame(maxWidth: .infinity, maxHeight: .infinity,  alignment: .bottomLeading)
                .padding(20)
            }
            .padding(.horizontal, 5)
    }
}

#Preview {
    BannerView(bodyPart: .upperLegs)
}
