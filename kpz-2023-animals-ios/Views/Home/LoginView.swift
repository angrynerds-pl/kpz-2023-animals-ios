//
//  LoginView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 06/06/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Email", text: $email)
                    SecureField("Hasło", text: $password)
                }
                Button("Zaloguj") {
                    homeViewModel.login(email: email, password: password)
                    if homeViewModel.isLogged {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Logowanie", displayMode: .inline)
            .navigationBarItems(leading: Button("Zamknij") { presentationMode.wrappedValue.dismiss() })
        }
    }
}



//struct LoginView: View {
//    @State private var email = ""
//    @State private var password = ""
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        NavigationView {
//            Form {
//                Section {
//                    TextField("Email", text: $email)
//                    SecureField("Hasło", text: $password)
//                }
//                Button("Zaloguj") {
//                    print("Logowanie... email: \(email)     hasło: \(password)")
//                }
//            }
//            .navigationBarTitle("Logowanie", displayMode: .inline)
//            .navigationBarItems(leading: Button("Zamknij") { presentationMode.wrappedValue.dismiss() })
//        }
//    }
//}
