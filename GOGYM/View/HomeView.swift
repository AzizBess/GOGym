//
//  HomeView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-09.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
//        ScrollView(.horizontal) {
//            HStack {
//                ForEach(BodyPart.allCases, id: \.hashValue) { item in
//                    ExtractedView(imageName: item.imageName, itemName: item.rawValue)
//                        .frame(height: 300)
//                }
//            }
//            .scrollTargetLayout()
//        }
//        
//        ScrollView(.horizontal) {
//            HStack {
//                ForEach(Equipement.allCases, id: \.hashValue) { item in
//                    ExtractedView(imageName: item.imageName, itemName: item.rawValue)
//                }
//            }
//            .scrollTargetLayout()
//        }
//        
//        .contentMargins(16, for: .scrollContent)
//        .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
//        .listStyle(.plain)
        
        CategoryItemView(viewModel: CategoryItemViewModel(bodyPart: .chest))
    }
}

#Preview {
    HomeView()
}

struct ExtractedView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    let imageName: String
    let itemName: String
    var body: some View {
//        VStack {
//            Image(imageName)
//                .resizable()
//                .frame(width: 80, height: 80)
//            Text(itemName)
//        }
//        .clipShape(
//            RoundedRectangle(cornerRadius: 10)
//        )
        ItemView(image: imageName, title: itemName)
        .containerRelativeFrame(.horizontal,
                                count: verticalSizeClass == .regular ? 2 : 4,
                                spacing: 16.0)
    }
}
