//
//  AnimalTIleView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 05/04/2023.
//

import SwiftUI

struct AnimalTileView: View {
    let animal: Animal

    var body: some View {
        HStack {
            Image(animal.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(10)

            Text(animal.description)
                .font(.system(size: 20))
                .padding(.leading, 10)
        }
    }
}
