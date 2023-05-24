//
//  TrainingTileView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 10/05/2023.
//

import SwiftUI

struct TrainingTileView: View {
    let training: Training

    var body: some View {
        NavigationLink(destination: TrainingProfileView(training: training)) {
            HStack {
                Image(training.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(training.name)
                        .font(.system(size: 26, weight: .semibold))
                    Text(training.location)
                        .font(.system(size: 16))
                }
                .padding(.leading, 10)
            }
            .padding(.vertical, 10)
        }
    }
}
