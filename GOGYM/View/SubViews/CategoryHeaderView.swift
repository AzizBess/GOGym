//
//  CategoryHeaderView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-14.
//

import SwiftUI

struct CategoryHeaderView: View {
    let image: String
    let title: String
    var body: some View {
        HStack(spacing: 20.0) {
            
            ZStack {
                Color(Color.random(opacity: 0.25))
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .overlay(
                        Circle()
                            .stroke(Color.random(), lineWidth: 3)
                    )
            }
            
            .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipShape(Circle())
                
            VStack {
                Text(title)
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                HStack {
                    Text("See all")
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
        .padding(.horizontal, 10.0)
    }
}

#Preview {
    CategoryHeaderView(image: "", title: "")
}
