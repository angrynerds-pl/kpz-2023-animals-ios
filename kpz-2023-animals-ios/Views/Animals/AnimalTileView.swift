//
//  AnimalTIleView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 05/04/2023.
//

import SwiftUI

struct AnimalTileView: View {
    let animal: Animal
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "pl_PL")
        return formatter
    }

    var body: some View {
        NavigationLink(destination: AnimalProfileView(animal: animal)) {
            HStack {
                Image(animal.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(animal.name)
                        .font(.system(size: 26, weight: .semibold))
                    
                    if let dateLost = animal.dateLost {
                        Text("Data zaginięcia: \(dateFormatter.string(from: dateLost))")
                            .font(.system(size: 16))
                    }

                    if let dateFound = animal.dateFound {
                        Text("Data znalezienia: \(dateFormatter.string(from: dateFound))")
                            .font(.system(size: 16))
                    }
                }
                .padding(.leading, 10)
            }
            .padding(.vertical, 10)
        }
    }
}
