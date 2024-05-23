//
//  Ransomware.swift
//  NetNinja
//
//  Created by apprenant64 on 03/05/2024.
//

import SwiftUI

struct Ransomware: View {
    
    
    var body: some View {
        VStack  {
            ScrollView {
                
                TypeText(titreDesProblemes: "•Description", couleurDesTitres: Color(.black), textDesProblèmes: "Le ransomware, aussi appelé rançongiciel, est un type de logiciel malveillant conçu pour bloquer l'accès à un système informatique ou à des données jusqu'à ce qu'une rançon soit payée par la victime. \nC'est une forme d'attaque cybercriminelle qui peut toucher des individus, des entreprises, ou même des institutions gouvernementales.")
                
                TypeText(titreDesProblemes: "•Risques", couleurDesTitres: .red, textDesProblèmes: "Confidentialité des données, si des données sensibles sont compromises par un ransomware, cela peut entraîner une violation de la confidentialité des données, ce qui peut avoir des conséquences légales et réglementaires importantes pour les organisations, notamment des amendes et des sanctions.\nRisque de propagation, les ransomwares peuvent se propager rapidement à travers les réseaux informatiques, infectant plusieurs systèmes et dispositifs connectés. Cela peut aggraver les dommages causés et rendre la récupération plus complexe. \nPour les entreprises, la perte d'accès aux données ou les violations de la confidentialité des données peuvent entraîner des conséquences juridiques et réglementaires graves. \nCela peut inclure des poursuites judiciaires, des amendes réglementaires, ou la perte de contrats avec des partenaires commerciaux.")
                
                TypeText(titreDesProblemes: "•Conséquences", couleurDesTitres: .orange, textDesProblèmes: "Perte d'accès,  les victimes peuvent perdre l'accès à des données cruciales, parfois de manière irréversible si la rançon n'est pas payée ou si les sauvegardes ont également été compromises. \nCoûts financiers, les cybercriminels exigent souvent le paiement d'une rançon en échange de la clé de déchiffrement nécessaire pour récupérer les données , les coûts peuvent aussi inclure les frais de réparation des systèmes, et les coûts associés aux efforts de récupération après l'attaque. \nPerturbations des opérations, pour les entreprises, cela peut entraîner une perturbation significative des opérations commerciales, voire un arrêt complet des activités.")
                TypeText(titreDesProblemes: "•Protection", couleurDesTitres: .blue, textDesProblèmes: "Pour se protéger contre les ransomwares, la meilleure défense commence par des pratiques de cybersécurité robustes. \nAssurez-vous que vos logiciels et systèmes d'exploitation sont toujours à jour avec les derniers correctifs de sécurité. \nUtilisez des logiciels de sécurité fiables pour détecter et bloquer les logiciels malveillants. \nÉduquez-vous et votre équipe sur les risques de ransomware, en mettant l'accent sur les moyens par lesquels ces logiciels malveillants se propagent, comme les courriels de phishing, les sites web compromis, ou les périphériques infectés. \nEffectuez des sauvegardes régulières de vos données essentielles et conservez-les dans un endroit sûr, hors ligne ou sur un service cloud sécurisé. \nAinsi, même en cas d'attaque, vous pourrez restaurer vos données sans avoir à payer de rançon. \nActivez l'authentification à deux facteurs (2FA) pour une sécurité accrue, et limitez l'accès aux systèmes critiques uniquement aux personnes qui en ont besoin. \nEn suivant ces mesures, vous pouvez réduire considérablement le risque d'être victime d'une attaque par ransomware et minimiser l'impact si une attaque se produit.")
                
            }
            
            
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Text("Ransomware")
                    .bold()
                    .foregroundStyle(.black)
                    .font(.title)
            }
        }
        
        
        
    }
}

#Preview {
    Ransomware()
}
