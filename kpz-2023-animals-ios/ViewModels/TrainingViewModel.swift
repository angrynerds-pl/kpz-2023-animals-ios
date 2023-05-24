//
//  TrainingViewModel.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/05/2023.
//

import Foundation

class TrainingListViewModel: ObservableObject {
    @Published var trainings: [Training] = []

    init() {
        trainings = [
            Training(image: "2", name: "Szkolenie 1", location: "Wrocław", description: "Opis szkolenia 1"),
            Training(image: "1", name: "Szkolenie 2", location: "Warszawa", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mi sapien"),
            Training(image: "1", name: "Szkolenie 3", location: "Kraków", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mi sapien, mattis et porttitor sodales, eleifend sit amet libero. Morbi accumsan nisi id urna porttitor congue. Proin scelerisque dolor non urna vulputate mattis."),
            Training(image: "1", name: "Szkolenie 4", location: "Poznań", description: "Opis szkolenia 4"),
            Training(image: "1", name: "Szkolenie 5", location: "Gdańsk", description: "Opis szkolenia 5")
        ]
    }
}
