//
//  HomeView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/04/2023.
//

import SwiftUI

struct HomeView: View {
    @Binding var animals: [Animal]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("6")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding()
                      
                    let columns = [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ]
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        NavigationLink(destination: ReportLostAnimalView(animals: $animals)) {
                            Text("Zgłoszenie zaginięcia")
                                .frame(width: 120, height: 100)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: ReportFoundAnimalView(animals: $animals)) {
                            Text("Zgłoszenie znalezienia")
                                .frame(width: 120, height: 100)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: AnimalListView(animals: animals)) {
                            Text("Przegląd zaginionych zwierząt")
                                .frame(width: 120, height: 100)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: AnimalListView(animals: animals)) {
                            Text("Profil zwierzaka")
                                .frame(width: 120, height: 100)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }.disabled(true).opacity(0.5)
                        
                        NavigationLink(destination: AnimalListView(animals: animals)) {
                            Text("Szkolenia")
                                .frame(width: 120, height: 100)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }.disabled(true).opacity(0.5)
                        
                        NavigationLink(destination: AnimalListView(animals: animals)) {
                            Text("Przychodnie weterynaryjne")
                                .frame(width: 120, height: 100)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }.disabled(true).opacity(0.5)
                        
                    }
                    .padding(40)
                }
            }
            .navigationBarTitle("Ekran główny", displayMode: .inline)
        }
    }
}
