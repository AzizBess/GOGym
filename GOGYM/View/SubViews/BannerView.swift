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
            .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 350, alignment: .center)
            .aspectRatio(contentMode: .fit)
            .overlay {
                VStack {
                    Text(bodyPart.name)
                        .font(.largeTitle).fontWeight(.bold)
                    Text("Equipement")
                        .font(.footnote).fontWeight(.bold)
                        
                }
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
