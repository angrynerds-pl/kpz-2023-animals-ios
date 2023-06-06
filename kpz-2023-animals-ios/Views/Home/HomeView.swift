//
//  HomeView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/04/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var animalViewModel = AnimalViewModel()
    @StateObject var homeViewModel = HomeViewModel()
    
    @State private var showLoginView = false
    @State private var showRegistrationView = false
    
    func fetchAnimals() {
        let animalController = AnimalController()
        Task {
            do {
                let animalsList = try await animalController.getAllAnimals()
                print(animalsList)
            } catch {
                print("Failed to get lost reports: \(error)")
            }
        }
    }
    
    func fetchLostReports() {
        let lostReportController = LostReportController()
        Task {
            do {
                let reportList = try await lostReportController.getAllLostReports()
                print(reportList)
            } catch {
                print("Failed to get lost reports: \(error)")
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding()
                    
//                    Button(action: {
//                        fetchAnimals()
//                    }) {
//                        Text("Fetch Animals")
//                    }
//
//                    Button(action: {
//                        fetchLostReports()
//                    }) {
//                        Text("Fetch Lost Reports")
//                    }
                    
                    let columns = [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ]
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        HomeScreenButton(destination: ReportLostAnimalView(animalVM: animalViewModel), text: "Zgłoszenie zaginięcia", showLoginView: $showLoginView, homeViewModel: homeViewModel)
                        HomeScreenButton(destination: ReportFoundAnimalView(animalVM: animalViewModel), text: "Zgłoszenie znalezienia", showLoginView: $showLoginView, homeViewModel: homeViewModel)
                        HomeScreenButton(destination: AnimalListView(animalVM: animalViewModel), text: "Przegląd zaginionych zwierząt", showLoginView: $showLoginView, homeViewModel: homeViewModel)
                        HomeScreenButton(destination: OwnedAnimalListView(), text: "Profil zwierzaka", showLoginView: $showLoginView, homeViewModel: homeViewModel)
                        HomeScreenButton(destination: TrainingListView(), text: "Szkolenia", showLoginView: $showLoginView, homeViewModel: homeViewModel)
                        HomeScreenButton(destination: VetClinicsMapView(), text: "Przychodnie weterynaryjne", showLoginView: $showLoginView, homeViewModel: homeViewModel)
                        
                    }
                    .padding(40)
                }
            }
            .navigationBarTitle("Ekran główny", displayMode: .inline)
            .navigationBarItems(leading:
                Menu {
                    Button(action: { showLoginView = true }) {
                        Text("Logowanie")
                        Image(systemName: "person.circle")
                    }
                    
                    Button(action: { showRegistrationView = true }) {
                        Text("Rejestracja")
                        Image(systemName: "person.badge.plus")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .padding()
                        .accessibilityLabel("Więcej opcji")
                }
            )
            .fullScreenCover(isPresented: $showLoginView) {
                LoginView(homeViewModel: homeViewModel)
            }
            .fullScreenCover(isPresented: $showRegistrationView) {
                RegistrationView(homeViewModel: homeViewModel)
            }
            .background(
                Image("bg1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            )
        }
    }
}
