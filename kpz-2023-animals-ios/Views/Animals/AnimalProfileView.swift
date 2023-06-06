//
//  AnimalProfileView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/04/2023.
//

import SwiftUI

struct AnimalProfileView: View {
    let animal: AnimalResponseDTO

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("6")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .cornerRadius(20)
                    .padding(.bottom, 10)
                
                Text("Imię: \(animal.name)")
                    .font(.system(size: 26, weight: .semibold))
                    .padding(.horizontal, 40)
                
                Text("Gatunek: \(animal.breed.type.name)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)

                Text("Rasa: \(animal.breed.name)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)
                
                Text("Płeć: \(animal.sex.rawValue)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)
                
                Text("Kolor: \(animal.color.name)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)
                
                Text("Właściciel: \(animal.ownerName) \(animal.ownerLastName)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)
                
                Text("Numer telefonu właściciela: \(animal.ownerPhoneNumber)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)

                Spacer()
            }
        }
    }
}
