//
//  NewOwnedAnimalView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/04/2023.
//

import SwiftUI

struct NewOwnedAnimalView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var ownedAnimalViewModel: OwnedAnimalViewModel

    @State private var name: String = ""
    @State private var chip: String = ""
    @State private var ownerId: Int? = nil
    @State private var animalColorId: Int = 1
    @State private var breedId: Int = 1
    
    @State private var sexString: String = "NIEZNANA"
    let sexes = AnimalSex.allCases.map { $0.rawValue }

    private var isFormValid: Bool {
        !name.isEmpty
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Podstawowe informacje")) {
                    TextField("Imię", text: $name)
                    TextField("Numer chipa", text: $chip)
                    Picker("Płeć", selection: $sexString) {
                        ForEach(sexes, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.menu)
                    TextField("ID właściciela", value: $ownerId, formatter: NumberFormatter())
                    TextField("ID koloru zwierzęcia", value: $animalColorId, formatter: NumberFormatter())
                    TextField("ID rasy zwierzęcia", value: $breedId, formatter: NumberFormatter())
                }

                Button(action: {
                    let newAnimal = AnimalRequestDTO(name: name,
                                                     chip: chip,
                                                     sex: AnimalSex(rawValue: sexString) ?? .nieznana,
                                                     ownerId: ownerId,
                                                     animalColorId: animalColorId,
                                                     breedId: breedId)
                    ownedAnimalViewModel.addOwnedAnimal(newAnimal: newAnimal)
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
