//
//  AttaqueQuiz.swift
//  NetNinja
//
//  Created by apprenant64 on 06/05/2024.
//

import SwiftUI


struct EcranFish: View {
    // Déclaration variables simples
    var titleNav: String
    var text_question: String
    // Déclaration variables d'état
    @State var boutonClick = false
    @State var modaleafficher = true
    @Binding var isValidationClicked: Bool   // Vérifie si le bouton n'est pas cliquables
    @State var BorderBouton = false
    var body: some View {
        VStack {
            HStack {
                Text("Quelle est la méthode la plus courante utilisée dans une attaque de phishing ?")
                    .bold()
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        
        
        if !isValidationClicked && !boutonClick {
            // Boutons COMPOSANT répétés 4 FOIS
            Composant_Bouton(textBoutonClick: "Cryptage des fichiers pour demander une rançon", color_bouton: .colorBleu, isValidationClicked: false)
            
            Composant_Bouton(textBoutonClick: "Inondation de trafic pour rendre un service indisponible", color_bouton: .colorBleu, isValidationClicked: false)
            Composant_Bouton(textBoutonClick: "Création de faux sites web pour voler des identifiants", color_bouton: .colorBleu, isValidationClicked: false)
            Composant_Bouton(textBoutonClick: "Manipulation de requêtes SQL pour accéder à des bases de données", color_bouton: .colorBleu, isValidationClicked: false)
            
        }
        
        if boutonClick {
            // Boutons COMPOSANT répétés 4 FOIS
            Composant_Bouton(textBoutonClick: "Cryptage des fichiers pour demander une rançon ", color_bouton: .colorResponse, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Inondation de trafic pour rendre un service indisponible", color_bouton: .colorResponse, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Création de faux sites web pour voler des identifiants", color_bouton: .colorAnswer, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Manipulation de requêtes SQL pour accéder à des bases de données", color_bouton: .colorResponse, isValidationClicked: true)
            // Importation du modal
            Modale(textExplication: "La question sur le phishing porte sur l'une des méthodes les plus courantes utilisées dans ces attaques : la création de faux sites web pour voler des identifiants. Les attaquants envoient des courriels ou des messages frauduleux contenant des liens menant à des sites web imitant des services légitimes, comme des banques ou des réseaux sociaux. Les victimes sont alors incitées à entrer leurs informations de connexion, qui sont ensuite volées par les attaquants.")
        }
        
        Spacer(minLength: 50)
        
        if !boutonClick && !isValidationClicked {
            Button(action: {
                // Action du bouton Valider
                boutonClick = true
                modaleafficher = false
                isValidationClicked = true
                BorderBouton = false
            }) {
                VStack {
                    Text("Valider !")
                        .frame(width:260, height: 30)
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 15))
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .disabled(isValidationClicked)
        }
    }
}

struct EcranRansom: View {
    // Déclaration variables simples
    var titleNav: String
    var text_question: String
    // Déclaration variables d'état
    @State var boutonClick = false
    @State var modaleafficher = true
    @Binding var isValidationClicked: Bool   // Vérifie si le bouton n'est pas cliquables
    @State var BorderBouton = false
    var body: some View {
        VStack {
            HStack {
                Text("Quelle est la principale caractéristique d'une attaque par ransomware ?")
                    .bold()
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        
        
        if !isValidationClicked && !boutonClick {
            // Boutons COMPOSANT répétés 4 FOIS
            Composant_Bouton(textBoutonClick: "Utilisation de requêtes SQL pour voler des données", color_bouton: .colorBleu, isValidationClicked: false)
            
            Composant_Bouton(textBoutonClick: "Chiffrement des fichiers en échange d'une rançon", color_bouton: .colorBleu, isValidationClicked: false)
            Composant_Bouton(textBoutonClick: "Interception des communications entre deux parties", color_bouton: .colorBleu, isValidationClicked: false)
            Composant_Bouton(textBoutonClick: "Inondation de trafic pour submerger un réseau", color_bouton: .colorBleu, isValidationClicked: false)
            
        }
        
        if boutonClick {
            // Boutons COMPOSANT répétés 4 FOIS
            Composant_Bouton(textBoutonClick: "Utilisation de requêtes SQL pour voler des données ", color_bouton: .colorResponse, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Chiffrement des fichiers en échange d'une rançon", color_bouton: .colorAnswer, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Interception des communications entre deux parties", color_bouton: .colorResponse, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Inondation de trafic pour submerger un réseau", color_bouton: .colorResponse, isValidationClicked: true)
            // Importation du modal
            Modale(textExplication: "Le ransomware est une attaque où des fichiers sont chiffrés par des logiciels malveillants, et une rançon est demandée pour les déchiffrer. Cette attaque peut causer des perturbations majeures pour les particuliers et les entreprises, car elle bloque l'accès à des données critiques jusqu'à ce que la rançon soit payée, ce qui n'est pas toujours une garantie de récupération des données.")
        }
        
        Spacer(minLength: 50)
        
        if !boutonClick && !isValidationClicked {
            Button(action: {
                // Action du bouton Valider
                boutonClick = true
                modaleafficher = false
                isValidationClicked = true
                BorderBouton = false
            }) {
                VStack {
                    Text("Valider !")
                        .frame(width:260, height: 30)
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 15))
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .disabled(isValidationClicked)
        }
    }
}

struct EcranDDOS:View {
    // Déclaration variables simples
    var titleNav: String
    var text_question: String
    // Déclaration variables d'état
    @State var boutonClick = false
    @State var modaleafficher = true
    @Binding var isValidationClicked: Bool   // Vérifie si le bouton n'est pas cliquables
    @State var BorderBouton = false
    var body: some View {
        VStack {
            HStack {
                Text("Qu'est-ce qui distingue une attaque DDoS des autres attaques ?")
                    .bold()
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        
        
        if !isValidationClicked && !boutonClick {
            // Boutons COMPOSANT répétés 4 FOIS
            Composant_Bouton(textBoutonClick: "Utilisation de logiciels malveillants pour voler des données", color_bouton: .colorBleu, isValidationClicked: false)
            
            Composant_Bouton(textBoutonClick: "Inondation de trafic depuis plusieurs sources pour rendre un service indisponible", color_bouton: .colorBleu, isValidationClicked: false)
            Composant_Bouton(textBoutonClick: "Manipulation de requêtes SQL pour compromettre une base de données", color_bouton: .colorBleu, isValidationClicked: false)
            Composant_Bouton(textBoutonClick: "Chiffrement des fichiers et demande de rançon pour les débloquer", color_bouton: .colorBleu, isValidationClicked: false)
            
        }
        
        if boutonClick {
            // Boutons COMPOSANT répétés 4 FOIS
            Composant_Bouton(textBoutonClick: "Utilisation de logiciels malveillants pour voler des données ", color_bouton: .colorResponse, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Inondation de trafic depuis plusieurs sources pour rendre un service indisponible", color_bouton: .colorAnswer, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Manipulation de requêtes SQL pour compromettre une base de données", color_bouton: .colorResponse, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Chiffrement des fichiers et demande de rançon pour les débloquer", color_bouton: .colorResponse, isValidationClicked: true)
            // Importation du modal
            Modale(textExplication: "Une attaque DDoS (Distributed Denial of Service) vise à rendre un service ou un réseau indisponible en inondant une cible de trafic provenant de plusieurs sources. Cette méthode s'appuie souvent sur des botnets, qui sont des réseaux d'ordinateurs compromis utilisés pour générer un volume massif de trafic, submergeant ainsi la capacité d'un serveur ou d'un réseau à répondre à des demandes légitimes.")
        }
        
        Spacer(minLength: 50)
        
        if !boutonClick && !isValidationClicked {
            Button(action: {
                // Action du bouton Valider
                boutonClick = true
                modaleafficher = false
                isValidationClicked = true
                BorderBouton = false
            }) {
                VStack {
                    Text("Valider !")
                        .frame(width:260, height: 30)
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 15))
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .disabled(isValidationClicked)
        }
    }
}

struct EcranSQL :View {
    // Déclaration variables simples
    var titleNav: String
    var text_question: String
    // Déclaration variables d'état
    @State var boutonClick = false
    @State var modaleafficher = true
    @Binding var isValidationClicked: Bool   // Vérifie si le bouton n'est pas cliquables
    @State var BorderBouton = false
    var body: some View {
        VStack {
            HStack {
                Text("Quelle est la technique utilisée dans les attaques par injection SQL ?")
                    .bold()
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        
        
        if !isValidationClicked && !boutonClick {
            // Boutons COMPOSANT répétés 4 FOIS
            Composant_Bouton(textBoutonClick: "Inondation de trafic pour submerger un serveur", color_bouton: .colorBleu, isValidationClicked: false)
            
            Composant_Bouton(textBoutonClick: "Interception des communications pour voler des données", color_bouton: .colorBleu, isValidationClicked: false)
            Composant_Bouton(textBoutonClick: "Insertion de code malveillant dans des requêtes SQL", color_bouton: .colorBleu, isValidationClicked: false)
            Composant_Bouton(textBoutonClick: "Cryptage des fichiers pour demander une rançon", color_bouton: .colorBleu, isValidationClicked: false)
            
        }
        
        if boutonClick {
            // Boutons COMPOSANT répétés 4 FOIS
            Composant_Bouton(textBoutonClick: "Inondation de trafic pour submerger un serveur ", color_bouton: .colorResponse, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Interception des communications pour voler des données", color_bouton: .colorResponse, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Insertion de code malveillant dans des requêtes SQL", color_bouton: .colorAnswer, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Cryptage des fichiers pour demander une rançon", color_bouton: .colorResponse, isValidationClicked: true)
            // Importation du modal
            Modale(textExplication: "L'injection SQL est une technique d'attaque où des attaquants insèrent du code SQL malveillant dans des requêtes SQL pour accéder à des bases de données ou manipuler des données. Cela peut permettre aux attaquants de voler des données sensibles, de modifier des informations stockées, ou de contourner les mécanismes de sécurité des applications web ou des systèmes de gestion de bases de données (SGBD).")
        }
        
        Spacer(minLength: 50)
        
        if !boutonClick && !isValidationClicked {
            Button(action: {
                // Action du bouton Valider
                boutonClick = true
                modaleafficher = false
                isValidationClicked = true
                BorderBouton = false
            }) {
                VStack {
                    Text("Valider !")
                        .frame(width:260, height: 30)
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 15))
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .disabled(isValidationClicked)
        }
    }
}

struct EcranMITM:View {
    // Déclaration variables simples
    var titleNav: String
    var text_question: String
    // Déclaration variables d'état
    @State var boutonClick = false
    @State var modaleafficher = true
    @Binding var isValidationClicked: Bool   // Vérifie si le bouton n'est pas cliquables
    @State var BorderBouton = false
    var body: some View {
        VStack {
            HStack {
                Text("Quel est le but principal d'une attaque MITM ?")
                    .bold()
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        
        
        if !isValidationClicked && !boutonClick {
            // Boutons COMPOSANT répétés 4 FOIS
            Composant_Bouton(textBoutonClick: "Intercepter et potentiellement modifier les communications entre deux parties", color_bouton: .colorBleu, isValidationClicked: false)
            
            Composant_Bouton(textBoutonClick: "Chiffrer des fichiers pour demander une rançon", color_bouton: .colorBleu, isValidationClicked: false)
            Composant_Bouton(textBoutonClick: "Submerger un serveur avec du trafic", color_bouton: .colorBleu, isValidationClicked: false)
            Composant_Bouton(textBoutonClick: "Exécuter des requêtes SQL malveillantes pour voler des données", color_bouton: .colorBleu, isValidationClicked: false)
            
        }
        
        if boutonClick {
            // Boutons COMPOSANT répétés 4 FOIS
            Composant_Bouton(textBoutonClick: "Intercepter et potentiellement modifier les communications entre deux parties ", color_bouton: .colorAnswer, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Chiffrer des fichiers pour demander une rançon", color_bouton: .colorResponse, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Submerger un serveur avec du trafic", color_bouton: .colorResponse, isValidationClicked: true)
            Composant_Bouton(textBoutonClick: "Exécuter des requêtes SQL malveillantes pour voler des données", color_bouton: .colorResponse, isValidationClicked: true)
            // Importation du modal
            Modale(textExplication: "Une attaque MITM (Man-in-the-Middle) se produit lorsqu'un attaquant intercepte les communications entre deux parties légitimes, souvent pour voler des données sensibles ou manipuler les informations échangées. Cela peut se produire via des réseaux non sécurisés, comme le Wi-Fi public, ou par des méthodes d'usurpation d'identité. Les attaquants peuvent ainsi intercepter des informations confidentielles, telles que des mots de passe ou des données financières, ou usurper l'identité d'une des parties pour effectuer des actions frauduleuses.")
        }
        
        Spacer(minLength: 50)
        
        if !boutonClick && !isValidationClicked {
            Button(action: {
                // Action du bouton Valider
                boutonClick = true
                modaleafficher = false
                isValidationClicked = true
                BorderBouton = false
            }) {
                VStack {
                    Text("Valider !")
                        .frame(width:260, height: 30)
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 15))
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .disabled(isValidationClicked)
        }
    }
}
