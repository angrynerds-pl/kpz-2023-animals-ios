//
//  AnimalListView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 05/04/2023.
//

import SwiftUI

struct AnimalListView: View {
    @ObservedObject var animalVM: AnimalViewModel

    var body: some View {
        NavigationView {
            List(animalVM.animals) { animal in
                AnimalTileView(animal: animal.animal, lostReport: animal)
            }
            .navigationBarTitle("Zaginione zwierzęta")
            .task {
                await animalVM.fetchLostReports()
            }
        }
    }
}
