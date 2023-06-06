//
//  LostReportResponseDTO.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 30/05/2023.
//

import Foundation

struct LostReportResponseDTO: Codable, Identifiable {
    let id: Int
    let animal: AnimalResponseDTO
    let status: ReportStatusDTO
    let lostDate: String
    let description: String
    let coordinate: CoordinateDTO
}

struct ReportStatusDTO: Codable {
    let id: Int
    let name: String
}

struct CoordinateDTO: Codable {
    let x: Double
    let y: Double
}
