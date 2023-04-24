//
//  ContentView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 29/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    let mockAnimals = [
        Animal(description: "Frodo\nLublin\n05.04.2023", image: "6"),
        Animal(description: "Frodo\nLublin\n05.04.2023", image: "7"),
        Animal(description: "Bella\nWrocław\n25.03.2023", image: "2"),
        Animal(description: "Bella\nWrocław\n30.03.2023", image: "3"),
        Animal(description: "Pumba\nOpole\n2.04.2023", image: "4"),
        Animal(description: "Pumba\nOpole\n1.04.2023", image: "5"),
        Animal(description: "Hektor\nKamieniec\n3.04.2022", image: "1")
    ]
    
    var body: some View {
        AnimalListView(animals: mockAnimals)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
