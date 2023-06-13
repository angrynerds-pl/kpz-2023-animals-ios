//
//  AnimalController.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 31/05/2023.
//

import Foundation

class AnimalController {
    func getAllAnimals() async throws -> [AnimalResponseDTO] {
        let serverCommunicator = ServerCommunicator()
        return try await serverCommunicator.getAll(endpoint: "animals")
    }

    func postAnimal(name : String, chip : String, sex : AnimalSex,
                    ownerId : Int, animalColorId : Int, breedId : Int) async throws {
        
        let animalRequestDTO = AnimalRequestDTO(name: name, chip: chip, sex: sex,
                                                ownerId: ownerId, animalColorId: animalColorId,
                                                breedId: breedId)
        let serverCommunicator = ServerCommunicator ()
        _ = try await serverCommunicator.post(endpoint: "animals", item: animalRequestDTO)
    }

    func getAnimalById(id : Int) async throws -> AnimalResponseDTO {
        let serverCommunicator = ServerCommunicator()
        return try await serverCommunicator.get(endpoint: "animals/\(id)")
    }
}



