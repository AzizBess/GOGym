//
//  GOGYMApp.swift
//  GOGYM
//
//  Created by Hana Salhi on 2023-09-30.
//

import SwiftUI

@main
struct GOGYMApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
