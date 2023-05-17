//
//  VetClinicsMapView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 10/05/2023.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
}

struct VetClinicsMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.1078852, longitude: 17.0385376),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location(name: "VetPlanet", address: "ul. Bajana 1, 53-680 Wrocław, Polska", coordinate: CLLocationCoordinate2D(latitude: 51.1027822, longitude: 17.0523444)),
        Location(name: "WETerynaria", address: "ul. Legnicka 52, 54-204 Wrocław, Polska", coordinate: CLLocationCoordinate2D(latitude: 51.1262675, longitude: 16.9879264)),
        Location(name: "Arka", address: "ul. Wiśniowa 56, 53-137 Wrocław, Polska", coordinate: CLLocationCoordinate2D(latitude: 51.0961986, longitude: 17.0250917)),
    ]
    
    @State private var selectedLocation: Location? = nil
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    Button(action: {
                        DispatchQueue.main.async {
                            selectedLocation = location
                        }
                    }) {
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Przychodnie weterynaryjne")
            .onTapGesture {
                selectedLocation = nil
            }
            .ignoresSafeArea()
            
            if let location = selectedLocation {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Image("8")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 140, height: 140)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading) {
                                    Text(location.name)
                                        .font(.system(size: 20, weight: .semibold))
                                    Text(location.address)
                                        .font(.system(size: 16))

                                }
                                .padding(.trailing, 20)
                            }
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        Spacer()
                    }
                    Spacer().frame(height: 50)
                }
            }
        }
    }
}


struct VetClinicsMapView_Previews: PreviewProvider {
    static var previews: some View {
        VetClinicsMapView()
    }
}
