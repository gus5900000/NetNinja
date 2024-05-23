//
//  Ddos.swift
//  NetNinja
//
//  Created by apprenant64 on 03/05/2024.
//

import SwiftUI

struct Ddos: View {
    var body: some View {
        VStack  {
            ScrollView {
                
                TypeText(titreDesProblemes: "•Description", couleurDesTitres: .black, textDesProblèmes: "DDoS signifie Distributed Denial of Service. \nIl s'agit d'une forme d'attaque informatique où un grand nombre de machines, souvent compromises par des logiciels malveillants, sont utilisées pour inonder de requêtes un serveur, un réseau ou une application, le submergeant et le rendant indisponible pour les utilisateurs légitimes.")
                
                TypeText(titreDesProblemes: "•Risques", couleurDesTitres: .red, textDesProblèmes: "Saturation des ressources, la cible de l'attaque, qu'il s'agisse d'un site web, d'un serveur ou d'une application, est submergée par le volume massif de trafic envoyé par les machines zombies. \nCela peut entraîner une surcharge des ressources du système, comme la bande passante du réseau, les capacités de traitement ou les connexions réseau, rendant le service inaccessible pour les utilisateurs légitimes. \nPerte de données, dans certains cas, les attaques DDoS peuvent servir de distraction pour d'autres activités malveillantes, telles que le vol de données sensibles ou la compromission des systèmes de sécurité pendant que l'attention est détournée. \nCela peut entraîner la perte ou la divulgation non autorisée de données confidentielles ou stratégiques. \nEffets collatéraux, les attaques DDoS peuvent avoir un impact négatif sur l'expérience utilisateur en rendant les services lents, inaccessibles ou inutilisables. \nCela peut frustrer les utilisateurs, entraîner une diminution de la satisfaction client et nuire à la fidélité à la marque.")
                
                TypeText(titreDesProblemes: "•Conséquences", couleurDesTitres: .orange, textDesProblèmes: "Indisponibilité des services, les sites web ou les applications ciblés deviennent inaccessibles pour les utilisateurs légitimes, ce qui peut entraîner une perte de revenus pour les entreprises ou une perturbation des activités pour les organisations. \nDétérioration de la réputation, les entreprises victimes d'attaques DDoS peuvent subir des dommages à leur réputation si elles ne sont pas en mesure de fournir des services fiables à leurs clients ou utilisateurs. \nCoûts de récupération, après une attaque DDoS, les entreprises peuvent devoir engager des coûts importants pour rétablir leurs services et atténuer les dommages. \nCela peut inclure l'investissement dans des solutions de protection DDoS, l'augmentation de la capacité de bande passante, l'embauche de consultants en sécurité et la mise en œuvre de mesures de sécurité supplémentaires.")
                TypeText(titreDesProblemes: "•Protection", couleurDesTitres: .blue, textDesProblèmes: "Pour se protéger contre les attaques DDoS (Distributed Denial of Service), commencez par utiliser des solutions de sécurité spécialisées qui détectent et atténuent le trafic malveillant avant qu'il n'atteigne votre infrastructure. \nAssurez-vous d'avoir une architecture de réseau robuste, capable d'absorber des pics de trafic grâce à des répartiteurs de charge et des systèmes de cache. \nAdoptez des pare-feux configurés pour bloquer le trafic suspect et réduisez les points d'entrée non nécessaires sur votre réseau. \nDéveloppez des plans de continuité des activités et de reprise après sinistre qui incluent des scénarios d'attaque DDoS, en précisant les étapes à suivre en cas d'attaque. \nLes systèmes de surveillance doivent fournir des alertes en temps réel pour permettre une réaction rapide. \nEn suivant ces mesures, vous pourrez minimiser l'impact d'une attaque DDoS et garantir la disponibilité de vos services.")
            }
            
            
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Text("DDOS")
                    .bold()
                    .foregroundStyle(.black)
                    .font(.title)
            }
        }
    }
}

#Preview {
    Ddos()
}
