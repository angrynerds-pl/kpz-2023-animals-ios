//
//  VetClinicsMapViewModel.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 24/05/2023.
//

import SwiftUI
import MapKit

class VetClinicsMapViewModel: ObservableObject {
    @Published var selectedLocation: Location? = nil
    let locations = [
        Location(name: "VetPlanet", address: "ul. Bajana 1, 53-680 Wrocław, Polska", coordinate: CLLocationCoordinate2D(latitude: 51.1027822, longitude: 17.0523444)),
        Location(name: "WETerynaria", address: "ul. Legnicka 52, 54-204 Wrocław, Polska", coordinate: CLLocationCoordinate2D(latitude: 51.1262675, longitude: 16.9879264)),
        Location(name: "Arka", address: "ul. Wiśniowa 56, 53-137 Wrocław, Polska", coordinate: CLLocationCoordinate2D(latitude: 51.0961986, longitude: 17.0250917)),
    ]

    func selectLocation(location: Location) {
        selectedLocation = location
    }

    func deselectLocation() {
        selectedLocation = nil
    }
}
