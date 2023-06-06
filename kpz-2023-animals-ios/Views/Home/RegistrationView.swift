//
//  RegistrationView.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 06/06/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var name = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Email", text: $email)
                    SecureField("Hasło", text: $password)
                    SecureField("Powtórz hasło", text: $confirmPassword)
                    TextField("Imię", text: $name)
                }
                Button("Zarejestruj") {
                    if password == confirmPassword {
                        homeViewModel.register(email: email, password: password)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Rejestracja", displayMode: .inline)
            .navigationBarItems(leading: Button("Zamknij") { presentationMode.wrappedValue.dismiss() })
        }
    }
}


//struct RegistrationView: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var confirmPassword = ""
//    @State private var name = ""
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section {
//                    TextField("Email", text: $email)
//                    SecureField("Hasło", text: $password)
//                    SecureField("Powtórz hasło", text: $confirmPassword)
//                    TextField("Imię", text: $name)
//                }
//                Button("Zarejestruj") {
//                    print("Rejestracja... email: \(email)   hasło: \(password)  powtórzone hasło: \(confirmPassword)    imię: \(name)")
//                }
//            }
//            .navigationBarTitle("Rejestracja", displayMode: .inline)
//            .navigationBarItems(leading: Button("Zamknij") { presentationMode.wrappedValue.dismiss() })
//        }
//    }
//}
