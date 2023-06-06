//
//  OwnedAnimalViewModel.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/05/2023.
//

import Foundation

class OwnedAnimalViewModel: ObservableObject {
    @Published var ownedAnimals: [AnimalResponseDTO] = []
    
    func fetchAnimals() async {
        do {
            let animalList = try await AnimalController().getAllAnimals()
            DispatchQueue.main.async {
                self.ownedAnimals = animalList
            }
        } catch {
            print(error)
        }
    }
    
    func printAnimals() {
        print(ownedAnimals)
    }
    
    init() {
        Task {
            await fetchAnimals()
        }
    }
    
    func addOwnedAnimal(newAnimal: AnimalRequestDTO) {
        let animalController = AnimalController()
        Task {
            do {
                try await animalController.postAnimal(name: newAnimal.name ?? "nieznane",
                                                      chip: newAnimal.chip ?? "123456789",
                                                      sex: AnimalSex.nieznana,
                                                      ownerId: newAnimal.ownerId ?? 1,
                                                      animalColorId: newAnimal.animalColorId,
                                                      breedId: newAnimal.breedId)
                
                await fetchAnimals()
                
            } catch {
                print("Failed to post animal: \(error)")
            }
        }
        
    }
}



//init() {
//    ownedAnimals = [
//        Animal(name: "Frodo",
//               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mi sapien, mattis et porttitor sodales",
//               image: "6", city: "Lublin", species: "Pies", breed: "Yorkshire Terrier", gender: "Samiec")
//    ]
//}
//
//func addOwnedAnimal(animal: Animal) {
//    ownedAnimals.append(animal)
//}
