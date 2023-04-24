//
//  Animal.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 05/04/2023.
//

import Foundation

struct Animal: Identifiable {
    var id = UUID()
    let description: String
    let image: String
}
