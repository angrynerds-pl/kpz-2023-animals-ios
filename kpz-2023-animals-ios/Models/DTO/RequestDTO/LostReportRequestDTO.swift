//
//  LostReportRequestDTO.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 31/05/2023.
//

import Foundation

struct LostReportRequestDTO: Codable {
    let lostDate: String
    let coordinate: CoordinateDTO
    let description: String
    let animalId: Int
    let reportStatusId: Int

    init(lostDate: String, coordinate: CoordinateDTO, description: String, animalId: Int, reportStatusId: Int = 1) {
        self.lostDate = lostDate
        self.coordinate = coordinate
        self.description = description
        self.animalId = animalId
        self.reportStatusId = reportStatusId
    }
}
