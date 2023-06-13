//
//  AnimalRequestDTO.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 31/05/2023.
//

import Foundation

struct AnimalRequestDTO: Codable {
    let name: String?
    let chip: String?
    let sex: AnimalSex
    let ownerId: Int?
    let animalColorId: Int
    let breedId: Int

    init(name: String? = nil, chip: String? = nil, sex: AnimalSex = .nieznana,
         ownerId: Int? = nil, animalColorId: Int = 1, breedId: Int = 1) {
        self.name = name
        self.chip = chip
        self.sex = sex
        self.ownerId = ownerId
        self.animalColorId = animalColorId
        self.breedId = breedId
    }
}

enum AnimalSex: String, Codable, CaseIterable {
    case samiec = "SAMIEC"
    case samica = "SAMICA"
    case nieznana = "NIEZNANA"
}
