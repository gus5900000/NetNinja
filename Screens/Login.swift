//
//  LOgin.swift
//  NetNinja
//
//  Created by apprenant58 on 02/05/2024.
//

import SwiftUI




struct Login: View {
    @State var nomDUtilisateur: String = ""
    @State var mdp: String = ""
    @State var directActu = false
    @State var afficherErreur = false
    @State var goToActu = false
    @State var navigationActive = false
    @ObservedObject var user = monUser

    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    Image("login")
                        .scaledToFit()
                        .padding(.bottom, 40.0)
                    
                    Text("Bienvenue !")
                        .font(.largeTitle)
                        .bold()
                        .padding(.trailing,170.0)
                    
                    TextField("Nom d'utilisateur", text: $nomDUtilisateur)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .padding(.leading, 120.0).padding(.trailing, 120.0).padding()
                    
                    SecureField("Mot de passe", text: $mdp)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .padding(.leading, 120.0).padding(.trailing, 120.0).padding()
                    Button(action: {
                        navigationActive = true
                        user.modaleConnected = true
                        user.modaleLogin = false

                    }) {
                        Text("Mot de passe oublié ?").font(.system(size: 12)).padding(.trailing, 200).padding(.top, 10)
                    }
                    .padding(.bottom, 20)
                    
                    if afficherErreur {
                        Text("Veuillez remplir tous les champs.")
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                    Button(action: {
                        user.modaleConnected = true
                        if nomDUtilisateur.isEmpty || mdp.isEmpty {
                            afficherErreur = true
                        } else {
                            afficherErreur = false
                            user.modaleLogin = false
                        }
                    }) {
                        Text("Valider")
                            .frame(width: 300)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(20.0)
                            .shadow(radius: 5)
                            .padding(.bottom)
                    }
                    
                    HStack{
                        Text("Pas encore membre ?").font(.system(size: 12))
                        
                        NavigationLink(destination: EnregistreToi()) {
                            Text("Enregistre toi !")
                                .font(.system(size: 12))
                        } }
                } }
        
        }
        .navigationBarHidden(true)
    }
}



#Preview {
    Login()
}

