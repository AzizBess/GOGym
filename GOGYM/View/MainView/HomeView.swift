//
//  HomeView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-09.
//

import SwiftUI

struct HomeView: View {
    var viewModel: HomeViewModel
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                if viewModel.loadFirstOnly ?? false {
                    CategoryItemView(viewModel: CategoryItemViewModel(bodyPart: .chest))
                } else {
                    ForEach(BodyPart.allCases, id: \.hashValue) {
                        CategoryItemView(viewModel: CategoryItemViewModel(bodyPart: $0))
                    }
                }
            }
            .navigationTitle("Go Gym")
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
