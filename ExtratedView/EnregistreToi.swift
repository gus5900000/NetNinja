//
//  EnregistreToi.swift
//  NetNinja
//
//  Created by apprenant58 on 30/04/2024.
//

import SwiftUI






struct EnregistreToi: View {
    
    @State var nomDUtilisateur: String = ""
    @State var mail: String = ""
    @State var mdp: String = ""
    @State var mdpConfirm: String = ""
    @State var erreur = false
    @State var isNavigationActive = false
    @State var mdpErreur = false
    
    
    var champNece: Bool {
        !nomDUtilisateur.isEmpty && !mail.isEmpty && !mdp.isEmpty && !mdpConfirm.isEmpty
    }
        
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Enregistre toi").bold().font(.system(size: 30)).padding(.trailing, 195.0).padding(.bottom)
                
                Text("Créer un compte pour commencer !").padding(.trailing, 100.0).padding(.bottom, 50.0)
                
                Text("Nom d'utilisateur").bold().padding(.trailing,220.0)
                
                TextField("Nom d'utilisateur", text: $nomDUtilisateur)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5).padding()
                
                Text("Adresse Mail").bold().padding(.trailing,250.0)
                
                TextField("Adresse Mail", text: $mail)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5).padding()
                
                Text("Mot de Passe").bold().padding(.trailing,250.0)
                
                SecureField("Créer un mot de passe", text: $mdp)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5).padding()
                
                if mdpErreur {
                    Text("Le mot de passe doit contenir au moins 8 caractères.")
                        .foregroundColor(.red)
                        .padding()
                }
                
                SecureField("Confirmer le mot de passe", text: $mdpConfirm)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5).padding().padding(.bottom, 20.0)
                
                
                if erreur {
                    Text("Veuillez remplir tous les champs.")
                        .foregroundColor(.red)
                        .padding()
                }
                Button(action: {
                    if champNece {
                        if mdp.count >= 8 {
                            isNavigationActive = true
                        } else {
                            mdpErreur = true
                        }
                    } else {
                        erreur = true
                    }
                }) {
                    Text("Valider")
                }
                .frame(width: 300)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(20.0)
                .shadow(radius: 5)
                .padding(.bottom, 10)
                .fullScreenCover(isPresented: $isNavigationActive, content: {
                    
                    Questionnaire()
                })
                
            }
        }.navigationBarBackButtonHidden(true) .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EnregistreToi()
}
