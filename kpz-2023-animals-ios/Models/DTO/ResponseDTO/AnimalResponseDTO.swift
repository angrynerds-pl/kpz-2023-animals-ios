//
//  AnimalResponseDTO.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 30/05/2023.
//

import Foundation

struct AnimalResponseDTO: Codable, Identifiable {
    let id: Int
    let chip: String
    let name: String
    let breed: BreedDTO
    let color: AnimalColorDTO
    let sex: AnimalSex
    let ownerId: Int
    let ownerName: String
    let ownerLastName: String
    let ownerPhoneNumber: String
    let animalPictures: [AnimalPictureDTO]
}

struct BreedDTO: Codable {
    let id: Int
    let name: String
    let type: TypeDTO
}

struct TypeDTO: Codable {
    let id: Int
    let name: String
}

struct AnimalColorDTO: Codable {
    let id: Int
    let name: String
}

struct AnimalPictureDTO: Codable {
    let id: Int
    let contentType: String
    let url: String
}


