//
//  HomeScreenButton.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 06/06/2023.
//

import SwiftUI

struct HomeScreenButton<Destination: View>: View {
    let destination: Destination
    let text: String
    @Binding var showLoginView: Bool
    @ObservedObject var homeViewModel: HomeViewModel

    var body: some View {
        ZStack {
            if homeViewModel.isLogged {
                NavigationLink(destination: self.destination) {
                    Text(self.text)
                        .frame(width: 120, height: 100)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            } else {
                Button(action: {
                    self.showLoginView = true
                }) {
                    Text(self.text)
                        .frame(width: 120, height: 100)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .opacity(0.5)
                }
                .fullScreenCover(isPresented: $showLoginView) {
                    LoginView(homeViewModel: homeViewModel)
                }
            }
        }
    }
}

