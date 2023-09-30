//
//  FuturesBootcamp.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-29.
//

import SwiftUI
import Combine
class FuturesBootcampViewModel: ObservableObject {
    @Published var title = "Starting Title"
    let url =  URL(string: "https://www.google.com")!
    var cancellables = Set<AnyCancellable>()
    
    init() {
        download()
    }
    
    func download() {
        // This code subscribes to the publisher method
        getCombinePublisher()
            .sink { _ in
                
            } receiveValue: { newValue in
                self.title = newValue
            }
            .store(in: &cancellables)

    }
    
    func getCombinePublisher() -> AnyPublisher<String, URLError> {
        // This code is the publisher method
        URLSession.shared.dataTaskPublisher(for: url)
            .timeout(1.0, scheduler: DispatchQueue.main)
            .map ({ _ in return "newValue" })
            .eraseToAnyPublisher()
    }
}

struct FuturesBootcamp: View {
    @StateObject private var viewModel = FuturesBootcampViewModel()
    var body: some View {
        Text(viewModel.title)
    }
}

struct FuturesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FuturesBootcamp()
    }
}
