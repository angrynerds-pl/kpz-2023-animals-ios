//
//  HomeView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/04/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var animalViewModel = AnimalViewModel()
    
    @State private var showLoginView = false
    @State private var showRegistrationView = false
    
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
                        NavigationLink(destination: ReportLostAnimalView(animalVM: animalViewModel)) {
                            Text("Zgłoszenie zaginięcia")
                                .frame(width: 120, height: 100)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: ReportFoundAnimalView(animalVM: animalViewModel)) {
                            Text("Zgłoszenie znalezienia")
                                .frame(width: 120, height: 100)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: AnimalListView(animalVM: animalViewModel)) {
                            Text("Przegląd zaginionych zwierząt")
                                .frame(width: 120, height: 100)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: OwnedAnimalListView()) {
                            Text("Profil zwierzaka")
                                .frame(width: 120, height: 100)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: TrainingListView()) {
                            Text("Szkolenia")
                                .frame(width: 120, height: 100)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: VetClinicsMapView()) {
                            Text("Przychodnie weterynaryjne")
                                .frame(width: 120, height: 100)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
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
                LoginView()
            }
            .fullScreenCover(isPresented: $showRegistrationView) {
                RegistrationView()
            }
        }
    }
}

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Email", text: $email)
                    SecureField("Hasło", text: $password)
                }
                Button("Zaloguj") {
                    print("Logowanie... email: \(email)     hasło: \(password)")
                }
            }
            .navigationBarTitle("Logowanie", displayMode: .inline)
            .navigationBarItems(leading: Button("Zamknij") { presentationMode.wrappedValue.dismiss() })
        }
    }
}

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var name = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Email", text: $email)
                    SecureField("Hasło", text: $password)
                    SecureField("Powtórz hasło", text: $confirmPassword)
                    TextField("Imię", text: $name)
                }
                Button("Zarejestruj") {
                    print("Rejestracja... email: \(email)   hasło: \(password)  powtórzone hasło: \(confirmPassword)    imię: \(name)")
                }
            }
            .navigationBarTitle("Rejestracja", displayMode: .inline)
            .navigationBarItems(leading: Button("Zamknij") { presentationMode.wrappedValue.dismiss() })
        }
    }
}
