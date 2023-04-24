//
//  Animal.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 05/04/2023.
//

import Foundation

import Foundation

struct Animal: Identifiable {
    var id = UUID()
    let name: String
    let description: String
    let image: String
    let city: String
    let species: String
    let breed: String
    let gender: String
    let dateLost: Date?
    let dateFound: Date?

    init(name: String, description: String, image: String, city: String,
         species: String? = "Nieznane", breed: String? = "Nieznane", gender: String? = "Nieznane",
         dateLost: Date? = nil, dateFound: Date? = nil) {
        self.name = name
        self.description = description
        self.image = image
        self.city = city
        self.species = species ?? "Nieznane"
        self.breed = breed ?? "Nieznane"
        self.gender = gender ?? "Nieznane"
        self.dateLost = dateLost
        self.dateFound = dateFound
    }
}
