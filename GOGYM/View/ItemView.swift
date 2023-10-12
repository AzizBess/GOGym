//
//  ItemView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-09.
//

import SwiftUI

struct ItemView: View {
    let image: String
    let title: String
    
    var body: some View {
//        GeometryReader { gr in
            Image(image)
                .resizable()
//                .aspectRatio(/*@START_MENU_TOKEN@*/1.5/*@END_MENU_TOKEN@*/, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                .overlay(alignment: .bottom) {
                    VStack {
                        HStack {
                            Text(title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color.white.gradient)
                                .padding(.bottom, 30)
                                .padding([.leading], 20)
                        }
                    }
                }
//        }
    }
}

#Preview {
    ItemView(image: "ChestWorkout", title: "Chest Exercices")
}
