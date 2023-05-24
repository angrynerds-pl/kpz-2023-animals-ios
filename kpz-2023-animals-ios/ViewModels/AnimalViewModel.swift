//
//  AnimalViewModel.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/05/2023.
//

import Foundation

class AnimalViewModel: ObservableObject {
    @Published var animals = [Animal]()
    
    let dateFormatter: DateFormatter
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        animals = [
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
    }
    
    func addLostAnimal(animal: Animal) {
        animals.append(animal)
    }
    
    func addFoundAnimal(animal: Animal) {
        animals.append(animal)
    }
}
