//
//  OnBoarding.swift
//  NetNinja
//
//  Created by apprenant64 on 10/05/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var user = monUser

    
    var body: some View {
        TabView {
            OnboardingPage(imagevar: "Icon", title: "Bienvenue sur NetNinja!", description: "Bienvenue dans notre application de prévention en cybersécurité, où nous vous protégeons contre les cinq principales attaques cybernétiques en vous fournissant des outils et des connaissances essentiels. \nNotre expertise et nos fonctionnalités simples vous aident à comprendre les enjeux qui vous concernent.")
            OnboardingPage(imagevar: "ButUtilisateur", title: "Connexion utilisateur !", description: "Pour une expérience personnalisée et une sécurité optimale, nous vous encourageons vivement à vous connecter à notre application. En vous connectant, vous nous permettez de mieux comprendre vos besoins spécifiques en matière de cybersécurité")
            OnboardingPage(imagevar: "FonctionApp", title: "Fonctionnalités de l'applications !", description: "Bienvenue dans notre application de cybersécurité, où vous restez informé, évaluez vos connaissances et suivez votre progression. Découvrez les dernières actualités, testez-vous avec notre quiz quotidien, explorez une documentation complète sur les attaques cybernétiques et suivez votre évolution via votre profil. Explorez ces fonctionnalités pour renforcer votre sécurité numérique.")
            NavigationStack{
                OnboardingPage(imagevar: "Redirection", title: "Redirection Application", description: "Veuillez choisir votre mode de connection : " )
                VStack {
                    Button(action:{
                        user.modaleStart = false
                        user.modaleLogin = true
                    }){
                        Text("Connexion")
                            .padding()
                            .frame(width: 200)
                            .foregroundColor(.blue)
                            .background(.white)
                        
                            .cornerRadius(15)
                            .padding(10)
                            .shadow(radius: 5)
                    }
                    
                    NavigationLink(destination:EnregistreToi()){
                        Text("Inscription")
                            .padding()
                            .frame(width: 200)
                            .foregroundColor(.white)
                            .background(.green)
                        
                            .cornerRadius(15)
                            .padding(10)
                            .shadow(radius: 5)
                    }
                    Button(action: {
                        user.modaleStart = false
                    }){
                        Text("Invité")
                            .padding()
                            .frame(width: 200)
                            .foregroundColor(.white)
                            .background(.blue)
                        
                            .cornerRadius(15)
                            .padding(10)
                            .shadow(radius: 5)
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingPage: View {
    
    var imagevar : String
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Image(imagevar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 30)
            
            VStack{
                Text(title)
                    .font(.title)
                    .bold()
                    .padding()
                
            }
            
            Text(description)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 30)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ContentView()
}
