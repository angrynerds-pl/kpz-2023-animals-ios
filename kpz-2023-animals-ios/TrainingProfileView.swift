//
//  TrainingProfileView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 10/05/2023.
//

import SwiftUI

struct TrainingProfileView: View {
    let training: Training

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(training.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .cornerRadius(20)
                    .padding(.bottom, 10)
                
                Text("Nazwa: \(training.name)")
                    .font(.system(size: 26, weight: .semibold))
                    .padding(.horizontal, 40)
                
                Text("Lokalizacja: \(training.location)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)

                Text("Opis: \(training.description)")
                    .font(.title2)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)

                Spacer()
            }
        }
    }
}
