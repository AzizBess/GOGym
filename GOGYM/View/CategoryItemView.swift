//
//  CategoryItemView.swift
//  GOGYM
//
//  Created by Aziz Bessrour on 2023-10-12.
//

import SwiftUI
import Combine

class CategoryItemViewModel: ObservableObject {
    @Published var exercices = Exercices()
    let bodyPart: BodyPart
    private var bag = Set<AnyCancellable>()
    
    init(bodyPart: BodyPart) {
        self.bodyPart = bodyPart
    }
    
    func fetchExerciceByBodyPart() {
        ExerciceService.shared
            .fetchExercicesByBodyPart(bodyPart)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {_ in }, receiveValue: { [weak self] exercices in
                self?.exercices = exercices
            })
            .store(in: &bag)
    }
}

struct CategoryItemView: View {
    @ObservedObject var viewModel: CategoryItemViewModel
    var body: some View {
        VStack {
            CategoryHeaderView(image: viewModel.bodyPart.logoName, title: "\(viewModel.bodyPart.rawValue.capitalized) Exercices")
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.exercices, id: \.id) { exercice in
                        ExerciceItemmView(imageURL: exercice.gifURL, title: exercice.name, subtitle: exercice.equipment ?? "")
                            .containerRelativeFrame(.horizontal,
                                                    count: 2,
                                                    spacing: 16.0)
                    }
                }
                .foregroundStyle(Color.random(opacity: 0.25))
                .scrollTargetLayout()
            }
            .frame(height: 500, alignment: .top)
            .contentMargins(16, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
        .listStyle(.plain)
        }
        .onAppear(perform: {
            viewModel.fetchExerciceByBodyPart()
        })

    }
}

#Preview {
    CategoryItemView(viewModel: CategoryItemViewModel(bodyPart: .chest))
}

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
                    .padding(5)
            }
            
            .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipShape(Circle())
                
            VStack {
                Text(title)
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
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
struct ExerciceItemmView: View {
    var imageURL: String
    var title: String
    var subtitle: String
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: URL(string: imageURL)) {
                    $0.image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200, alignment: .center)
                }
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                Color.random(opacity: 0.25)
            }
            .clipShape(RoundedRectangle(cornerRadius: 15.0))

            .padding(.vertical, 15)
            Text(title)
                .font(.title3)
                .lineLimit(1)
                .bold()
                .foregroundStyle(Color.black.gradient)
            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(Color.black.gradient)
        }
    }
}



public extension Color {

    static func random(randomOpacity: Bool = false, opacity: Double = 1) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : opacity
        )
    }
}
