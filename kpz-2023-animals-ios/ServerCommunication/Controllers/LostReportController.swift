//
//  LostReportController.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 30/05/2023.
//

import Foundation

class LostReportController {
    
    func getAllLostReports() async throws -> [LostReportResponseDTO] {
        let serverCommunicator = ServerCommunicator()
        return try await serverCommunicator.get(endpoint: "lost")
    }
    
    func postLostReport(lostDate: String, coordinate: CoordinateDTO, description: String, animalId: Int, reportStatusId: Int) async throws {
        let lostReportRequestDTO = LostReportRequestDTO(lostDate: lostDate,
                                                        coordinate: coordinate,
                                                        description: description,
                                                        animalId: animalId,
                                                        reportStatusId: reportStatusId)

        let serverCommunicator = ServerCommunicator()
        _ = try await serverCommunicator.post(endpoint: "lost", item: lostReportRequestDTO)
    }
}
