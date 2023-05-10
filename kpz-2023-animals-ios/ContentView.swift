//
//  ContentView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 29/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var mockAnimals: [Animal]
    @State private var mockOwnedAnimals: [Animal]
    @State private var mockTrainings: [Training]
    
    let dateFormatter: DateFormatter
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        mockOwnedAnimals = [
            Animal(name: "Frodo",
                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mi sapien, mattis et porttitor sodales",
                   image: "6", city: "Lublin", species: "Pies", breed: "Yorkshire Terrier", gender: "Samiec")
        ]
        
        mockAnimals = [
            Animal(name: "Frodo",
                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mi sapien, mattis et porttitor sodales",
                   image: "6", city: "Lublin", species: "Pies", breed: "Yorkshire Terrier", gender: "Samiec",
                   dateLost: dateFormatter.date(from: "2023/05/04")),
            
            Animal(name: "Frodo",
                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mi sapien, mattis et porttitor sodales",
                   image: "7", city: "Lublin", species: "Pies", breed: "Yorkshire Terrier", gender: "Samiec",
                   dateLost: dateFormatter.date(from: "2023/05/04"), dateFound: dateFormatter.date(from: "2023/05/06")),
            
            Animal(name: "Bella",
                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mi sapien, mattis et porttitor sodales, eleifend sit amet libero. Morbi accumsan nisi id urna porttitor congue. Proin scelerisque dolor non urna vulputate mattis. Fusce vel sapien nec sem bibendum viverra. Cras consequat ligula vel ipsum semper, a blandit lectus hendrerit.",
                   image: "2", city: "Wrocław", species: "Pies", gender: "Samica",
                   dateLost: dateFormatter.date(from: "2023/03/25")),
            
            Animal(name: "Bella",
                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mi sapien, mattis et porttitor sodales, eleifend sit amet libero. Morbi accumsan nisi id urna porttitor congue. Proin scelerisque dolor non urna vulputate mattis. Fusce vel sapien nec sem bibendum viverra. Cras consequat ligula vel ipsum semper, a blandit lectus hendrerit. ",
                   image: "3", city: "Wrocław", species: "Pies", gender: "Samica",
                   dateLost: dateFormatter.date(from: "2023/03/30")),
            
            Animal(name: "Pumba",
                   description: "Opole",
                   image: "4", city: "Opole", species: "Pies", gender: "Samiec",
                   dateLost: dateFormatter.date(from: "2023/04/02")),
            
            Animal(name: "Pumba",
                   description: "Opole",
                   image: "5", city: "Opole", species: "Pies", gender: "Samiec",
                   dateLost: dateFormatter.date(from: "2023/04/01")),
            
            Animal(name: "Hektor",
                   description: "Kamieniec",
                   image: "1", city: "Kamieniec", species: "Pies", gender: "Samiec",
                   dateLost: dateFormatter.date(from: "2023/04/03"), dateFound: dateFormatter.date(from: "2023/04/08"))
        ]
        
        mockTrainings = [
            Training(image: "1", name: "Szkolenie 1", location: "Wrocław", description: "Opis szkolenia 1"),
            Training(image: "1", name: "Szkolenie 2", location: "Warszawa", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mi sapien"),
            Training(image: "1", name: "Szkolenie 3", location: "Kraków", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mi sapien, mattis et porttitor sodales, eleifend sit amet libero. Morbi accumsan nisi id urna porttitor congue. Proin scelerisque dolor non urna vulputate mattis."),
            Training(image: "1", name: "Szkolenie 4", location: "Poznań", description: "Opis szkolenia 4"),
            Training(image: "1", name: "Szkolenie 5", location: "Gdańsk", description: "Opis szkolenia 5")
        ]

    }

    
    var body: some View {
        HomeView(animals: $mockAnimals, ownedAnimals: $mockOwnedAnimals, trainings: $mockTrainings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
