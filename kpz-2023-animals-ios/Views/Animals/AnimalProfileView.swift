//
//  AnimalProfileView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/04/2023.
//

import SwiftUI

struct AnimalProfileView: View {
    let animal: Animal
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "pl_PL")
        return formatter
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(animal.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .cornerRadius(20)
                    .padding(.bottom, 10)
                
                Text("Imię: \(animal.name)")
                    .font(.system(size: 26, weight: .semibold))
                    .padding(.horizontal, 40)

                Text("Gatunek: \(animal.species)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)
                
                Text("Rasa: \(animal.breed)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)

                Text("Płeć: \(animal.gender)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)
                
                Text("Opis: \(animal.description)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)
                
                Text("\((animal.dateLost != nil) || (animal.dateFound != nil) ? "Miejsce zaginięcia:" : "Miasto:") \(animal.city)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)
                
                if let dateLost = animal.dateLost {
                    Text("Data zaginięcia: \(dateFormatter.string(from: dateLost))")
                        .font(.title2)
                        .padding(.leading, 40)
                        .padding(.vertical, 5)
                }

                if let dateFound = animal.dateFound {
                    Text("Data znalezienia: \(dateFormatter.string(from: dateFound))")
                        .font(.title2)
                        .padding(.leading, 40)
                        .padding(.vertical, 5)
                }

                Spacer()
            }
        }
    }
}
