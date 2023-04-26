//
//  NewOwnedAnimalView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/04/2023.
//

import SwiftUI

struct NewOwnedAnimalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var ownedAnimals: [Animal]

    @State private var name: String = ""
    @State private var description: String = ""
    @State private var image: String = "8"
    @State private var city: String = ""
    @State private var species: String = ""
    @State private var breed: String = ""
    @State private var gender: String = ""
    @State private var dateLost: Date = Date()
    
    private var isFormValid: Bool {
        !name.isEmpty && !description.isEmpty && !image.isEmpty &&
        !city.isEmpty && !species.isEmpty && !breed.isEmpty && !gender.isEmpty
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Podstawowe informacje")) {
                    TextField("Imię", text: $name)
                    TextField("Opis", text: $description)
                    TextField("Miasto", text: $city)
                }

                Section(header: Text("Dodatkowe informacje")) {
                    TextField("Gatunek", text: $species)
                    TextField("Rasa", text: $breed)
                    TextField("Płeć", text: $gender)
                }

                Button(action: {
                    let newAnimal = Animal(name: name,
                                           description: description,
                                           image: image,
                                           city: city,
                                           species: species,
                                           breed: breed,
                                           gender: gender)
                    ownedAnimals.append(newAnimal)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Zatwierdź")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(isFormValid ? Color.blue : Color.blue.opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(!isFormValid)
            }
            .navigationBarTitle("Dodaj nowego zwierzaka", displayMode: .inline)
        }
    }
}

