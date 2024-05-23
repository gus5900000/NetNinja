//
//  Phishing.swift
//  NetNinja
//
//  Created by apprenant64 on 03/05/2024.
//

import SwiftUI

struct Phishing: View {
    
    var body: some View {
        VStack  {
            ScrollView {
                
                TypeText(titreDesProblemes: "•Description", couleurDesTitres: Color.black, textDesProblèmes: "Le phishing aussi appelé hameçonnage, est une technique de cyberattaque utilisée par des fraudeurs pour tenter d'obtenir des informations sensibles telles que les noms d'utilisateur, les mots de passe, les informations de carte de crédit, et d'autres données personnelles en se faisant passer pour une source fiable. \nLes attaques de phishing peuvent se produire par divers moyens, notamment les courriels, les messages textes, les réseaux sociaux, ou même par téléphone.")
                
                TypeText(titreDesProblemes: "•Risques", couleurDesTitres: .red, textDesProblèmes: "Pertes d’argent, une conséquence directe et immédiate du phishing peut être la perte financière due à l'accès non autorisé à des comptes bancaires ou à l'utilisation frauduleuse de cartes de crédit. \nVol d’identité, le vol d'informations personnelles sensibles, comme le numéro de sécurité sociale, peut conduire au vol d'identité, où les fraudeurs utilisent l'identité de la victime. \nAccès non autorisé aux systèmes d'entreprise, en obtenant des informations d'identification de connexion via le phishing, les attaquants peuvent accéder à des réseaux d'entreprise, compromettant potentiellement des données sensibles de l'entreprise, telles que des secrets commerciaux ou des informations personnelles des employés.")
                
                TypeText(titreDesProblemes: "•Conséquences", couleurDesTitres: .orange, textDesProblèmes: "Vol d’informations personnelles, Les fraudeurs peuvent utiliser des sites de phishing pour collecter des informations personnelles telles que les noms, les adresses, les numéros de sécurité sociale, les numéros de carte de crédit et d'autres données sensibles.  \nInfection par logiciels malveillants, les e-mails de phishing peuvent contenir des liens ou des pièces jointes malveillantes qui, lorsqu'ils sont ouverts, peuvent infecter les systèmes avec des logiciels malveillants tels que des virus, des chevaux de Troie ou des ransomwares. Ces infections peuvent causer des dommages aux données, aux systèmes informatiques et compromettre la sécurité des réseaux. \nPerte de confiance, après avoir été victime de phishing, beaucoup de personnes ressentent une diminution de la confiance dans les transactions en ligne ou dans l'utilisation de la technologie numérique. \nStress et anxiété, être victime de phishing peut causer un stress significatif et de l'anxiété, surtout si la résolution des problèmes causés par l'attaque s'avère compliquée et prolongée")
                TypeText(titreDesProblemes: "•Protection", couleurDesTitres: .blue, textDesProblèmes: "Pour se protéger contre le phishing, la première étape est la sensibilisation. \nApprenez à reconnaître les signes typiques des attaques de phishing, comme les courriels ou les messages avec des fautes d'orthographe, des demandes urgentes, ou des liens douteux. \nUtilisez des logiciels de sécurité avec des fonctions de détection et de blocage des menaces. \nL'authentification à deux facteurs (2FA) offre une protection supplémentaire en nécessitant un code de vérification pour accéder à vos comptes. \nMéfiez-vous des liens et des pièces jointes dans les courriels non sollicités, et vérifiez l'adresse de l'expéditeur. \nUtilisez des mots de passe forts et uniques, de préférence avec un gestionnaire de mots de passe. \nEnfin, surveillez régulièrement vos comptes bancaires et signalez toute activité suspecte à votre institution financière ou à votre service informatique. \nCes mesures simples mais efficaces peuvent considérablement réduire le risque de tomber victime d'une attaque de phishing.")
            }
            
            
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Text("Phishing")
                    .bold()
                    .foregroundStyle(.black)
                    .font(.title)
            }
        }
    }
        
}
#Preview {
    Phishing()
}
