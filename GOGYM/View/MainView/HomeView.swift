//
//  HomeView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-09.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ForEach(BodyPart.allCases, id: \.hashValue) {
                    CategoryItemView(viewModel: CategoryItemViewModel(bodyPart: $0))
                }
            }
            .navigationTitle("Go Gym")
        }
    }
}

#Preview {
    HomeView()
}
