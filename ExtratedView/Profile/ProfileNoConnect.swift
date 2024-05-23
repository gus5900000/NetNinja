//
//  ProfileNoConnect.swift
//  NetNinja
//
//  Created by apprenant64 on 10/05/2024.
//

import SwiftUI

struct ProfileNoConnect: View {
    
    var colorButton: Color = .white
    @ObservedObject var user = monUser
    
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Image("ProfilBlur")
                    .resizable()
                    .scaledToFill()
                
                VStack {
                    Text("Connecte-toi pour accéder \nà tes informations.")
                        .frame(width: 250,height: 70)
                        .background(colorButton)
                        .multilineTextAlignment(.center)
                        .cornerRadius(15)
                        .padding()
                        .bold()
                        .shadow(radius: 5)
                    HStack {
                        Button (action: {
                            user.modaleLogin = true
                        }) {
                            
                            HStack {
                                Image(systemName: "checkmark.gobackward")
                                Text("Connexion")
                            }.frame(width: 150,height: 50)
                                .background(.colorBleu)
                                .cornerRadius(15)
                                .foregroundStyle(.white)
                                .shadow(radius: 5)
                        }
                        Button(action: {
                            user.modaleRegister = true
                        }) {
                            
                            HStack {
                                Image(systemName: "highlighter")
                                Text("Enregistre-toi")
                            }.frame(width: 150,height: 50)
                                .background(.colorAnswer)
                                .cornerRadius(15)
                                .foregroundStyle(.white)
                                .shadow(radius: 5)
                        }
                    }
                    
                }
                .frame(width: 325,height: 300)
            }
            
        }
    }
}


#Preview {
    ProfileNoConnect()
}
