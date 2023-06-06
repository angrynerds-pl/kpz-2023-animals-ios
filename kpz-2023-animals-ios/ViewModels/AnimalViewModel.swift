//
//  AnimalViewModel.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/05/2023.
//

import Foundation

class AnimalViewModel: ObservableObject {
    @Published var animals: [LostReportResponseDTO] = []

    func fetchLostReports() async {
        do {
            let lostReports = try await LostReportController().getAllLostReports()
            DispatchQueue.main.async {
                self.animals = lostReports
            }
        } catch {
            print(error)
        }
    }
    
    func addLostAnimal(lostReport: LostReportRequestDTO, newAnimal: AnimalRequestDTO) {
        
        let animalController = AnimalController()
        let lostReportController = LostReportController()
        Task {
            do {
                try await animalController.postAnimal(name: newAnimal.name ?? "nieznane",
                                                      chip: newAnimal.chip ?? "123456789",
                                                      sex: AnimalSex.nieznana,
                                                      ownerId: newAnimal.ownerId ?? 1,
                                                      animalColorId: newAnimal.animalColorId,
                                                      breedId: newAnimal.breedId)
                
                let animalsList = try await animalController.getAllAnimals()
                
                try await lostReportController.postLostReport(lostDate: lostReport.lostDate,
                                                              coordinate: lostReport.coordinate,
                                                              description: lostReport.description,
                                                              animalId: animalsList.count,
                                                              reportStatusId: lostReport.reportStatusId)
                
                await fetchLostReports()
            } catch {
                print("Failed to post animal: \(error)")
            }
        }
    }
}
