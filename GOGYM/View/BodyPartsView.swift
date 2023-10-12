//
//  BodyPartsView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-11.
//

import SwiftUI

struct BodyPartsView: View {
    var colors: [Color] = [.red, .yellow, .green, .purple, .pink, .brown]
    var body: some View {
        List {
            ForEach(BodyPart.allCases, id: \.rawValue) {
                Text($0.rawValue.capitalized)
                    .font(.caption)
                    .padding()
                HorizontalScrollView(color: colors[Int.random(in: colors.indices)])
            }
        }
        .listStyle(.plain)
    }
}



struct HorizontalScrollView: View {
    let color: Color
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(1...5, id: \.hashValue) { item in
                    RoundedRectangle(cornerSize: CGSize(width: 30, height: 300), style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .containerRelativeFrame(.horizontal,
                                                count: 3,
                                                spacing: 16.0)
                }
            }
            .foregroundStyle(color.gradient)
            .scrollTargetLayout()
        }
        
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
        .listStyle(.plain)
    }
}

#Preview {
    BodyPartsView()
}
