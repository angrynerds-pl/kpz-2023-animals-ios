//
//  ReportLostAnimalView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/04/2023.
//

import SwiftUI
import UIKit

struct ReportLostAnimalView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var animalVM: AnimalViewModel

    @State private var name: String = ""
    @State private var chip: String = ""
    @State private var sex: String = ""
    @State private var ownerId: String = ""
    @State private var animalColorId: String = ""
    @State private var breedId: String = ""
    @State private var description: String = ""
    
    @State private var lostDate: Date = Date()
    @State private var xCoordinate: String = ""
    @State private var yCoordinate: String = ""

    @State private var image: String = "8"
    @State private var showImagePicker = false
    @State private var pickedImage: UIImage?

    private var isFormValid: Bool {
        !name.isEmpty && !chip.isEmpty && !sex.isEmpty && !animalColorId.isEmpty && !breedId.isEmpty && !description.isEmpty
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    var body: some View {
        NavigationView {
            Form {
                ZStack {
                    if let uiImage = pickedImage {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                    } else {
                        Rectangle()
                            .fill(.secondary)
                            .frame(height: 100)
                        Text("Dodaj zdjęcie")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    showImagePicker.toggle()
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(image: $pickedImage)
                }

                Section(header: Text("Informacje o zwierzaku")) {
                    TextField("Imię", text: $name)
                    TextField("Chip", text: $chip)
                    TextField("Płeć (wpisz liczbę)", text: $sex)
                    TextField("Identyfikator koloru zwierzęcia", text: $animalColorId)
                    TextField("Identyfikator rasy", text: $breedId)
                }
                
                Section(header: Text("Informacje o zaginięciu")) {
                    TextField("Opis", text: $description)
                    DatePicker("Data zaginięcia", selection: $lostDate, displayedComponents: .date)
                }
                
                Button(action: {
                    let newAnimal = AnimalRequestDTO(name: name,
                                                     chip: chip,
                                                     sex: AnimalSex.nieznana,
                                                     ownerId: Int(ownerId) ?? 1,
                                                     animalColorId: Int(animalColorId) ?? 1,
                                                     breedId: Int(breedId) ?? 1)
                    
                    let lostReport = LostReportRequestDTO(
                        lostDate: dateFormatter.string(from: lostDate),
                        coordinate: CoordinateDTO(x: Double(xCoordinate) ?? 51.1078852, y: Double(yCoordinate) ?? 17.0385376),
                        description: description,
                        animalId: 10,
                        reportStatusId: 1
                    )
                    animalVM.addLostAnimal(lostReport: lostReport, newAnimal: newAnimal)
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
            .navigationBarTitle("Zgłoś zaginięcie", displayMode: .inline)
            
        }
    }
}
