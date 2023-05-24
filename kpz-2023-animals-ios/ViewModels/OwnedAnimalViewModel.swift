//
//  OwnedAnimalViewModel.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/05/2023.
//

import Foundation

class OwnedAnimalViewModel: ObservableObject {
    @Published var ownedAnimals: [Animal] = [
        Animal(name: "Frodo",
               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mi sapien, mattis et porttitor sodales",
               image: "6", city: "Lublin", species: "Pies", breed: "Yorkshire Terrier", gender: "Samiec")
    ]
    
    func addOwnedAnimal(_ animal: Animal) {
        ownedAnimals.append(animal)
    }
}
