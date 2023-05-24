//
//  VetClinicsMapView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 10/05/2023.
//

import SwiftUI
import MapKit

struct VetClinicsMapView: View {
    @StateObject var viewModel = VetClinicsMapViewModel()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.1078852, longitude: 17.0385376),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: viewModel.locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    Button(action: {
                        viewModel.selectLocation(location: location)
                    }) {
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Przychodnie weterynaryjne")
            .ignoresSafeArea()
            
            if let location = viewModel.selectedLocation {
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
                            .onTapGesture {
                                viewModel.deselectLocation()
                            }
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
