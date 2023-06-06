//
//  OwnedAnimalListWiev.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/04/2023.
//

import SwiftUI

struct OwnedAnimalListView: View {
    @ObservedObject var ownedAnimalViewModel = OwnedAnimalViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List(ownedAnimalViewModel.ownedAnimals) { animal in
                    OwnedAnimalTileView(animal: animal)
                }
                .navigationBarTitle("Twoje zwierzęta")
                
                
                NavigationLink(destination: NewOwnedAnimalView(ownedAnimalViewModel: ownedAnimalViewModel)) {
                    Text("Dodaj")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
    }
}
