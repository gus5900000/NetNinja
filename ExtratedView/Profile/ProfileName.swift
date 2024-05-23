//
//  ProfileName.swift
//  NetNinja
//
//  Created by apprenant64 on 13/05/2024.
//

import SwiftUI

struct ProfileName: View {
    
    @State var showAlert = false
    @State var text: String = "Pas de pseudo"
    
    let alertTitle: String = "Nom d'utilisateur."
    
    var body: some View {
        Button(text) {
            showAlert = true
            text = ""
        }
        .foregroundStyle(.black)
        .bold()
        .alert(
            Text(alertTitle),
            isPresented: $showAlert
        ) {
            Button("Cancel", role: .cancel) {
                if text == "" {
                    text = "Pas de pseudo"
                } else {
                    text = text
                }
            }
            Button("OK") {
                if text == "" {
                    text = "Pas de pseudo"
                } else {
                    text = text
                }
            }
            
            TextField("Enter", text: $text)
        } message: {
            Text("Rentre ton nom d'utilisateur.")
        }
    }
}

#Preview {
    ProfileName()
}
