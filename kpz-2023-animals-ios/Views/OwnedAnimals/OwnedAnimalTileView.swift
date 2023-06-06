//
//  OwnedAnimalTileView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 06/06/2023.
//

import SwiftUI

struct OwnedAnimalTileView: View {
    let animal: AnimalResponseDTO
    
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
                Image("6")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(animal.name)
                        .font(.system(size: 26, weight: .semibold))
                }
                .padding(.leading, 10)
            }
            .padding(.vertical, 10)
        }
    }
}
