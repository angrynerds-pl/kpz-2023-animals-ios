//
//  TrainingListView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 10/05/2023.
//

import SwiftUI

struct TrainingListView: View {
    let trainings: [Training]

    var body: some View {
        NavigationView {
            List(trainings) { training in
                TrainingTileView(training: training)
            }
            .navigationBarTitle("Szkolenia")
        }
    }
}
