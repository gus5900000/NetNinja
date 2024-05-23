//
//  Mitm.swift
//  NetNinja
//
//  Created by apprenant64 on 03/05/2024.
//

import SwiftUI

struct Mitm: View {
    var body: some View {
        VStack  {
            ScrollView {
                TypeText(titreDesProblemes: "•Description", couleurDesTitres: .black, textDesProblèmes: "Une attaque MITM, ou Man-in-the-Middle (Homme du Milieu), est une forme d'attaque informatique où un attaquant insère de manière frauduleuse son propre équipement ou logiciel entre deux parties légitimes qui communiquent, telles que deux utilisateurs finaux, un utilisateur et un serveur, ou deux serveurs. \nL'attaquant intercepte et peut potentiellement modifier ou altérer les communications entre les deux parties sans que celles-ci ne le sachent.")
                TypeText(titreDesProblemes: "•Risques", couleurDesTitres: .red, textDesProblèmes: "Interception de données sensibles, l'attaquant peut intercepter les données échangées entre les deux parties légitimes, ce qui peut inclure des informations personnelles, des mots de passe, des données financières ou d'autres données sensibles. \nManipulation des données, l'attaquant peut altérer les données en transit, en modifiant leur contenu avant qu'elles n'atteignent leur destination. \nCela peut entraîner des conséquences graves, telles que la manipulation de transactions financières ou la falsification de documents. \nUsurpation d’identité, l'attaquant peut se faire passer pour l'une des parties légitimes dans la communication, ce qui lui permet de mener des activités frauduleuses au nom de cette partie. \nCela peut inclure l'usurpation de comptes en ligne, l'envoi de courriels frauduleux ou la manipulation de transactions.")
                TypeText(titreDesProblemes: "•Conséquences", couleurDesTitres: .orange, textDesProblèmes: "Perte de confidentialité, les communications confidentielles peuvent être compromises, compromettant la confidentialité des informations échangées entre les deux parties. \nCela peut avoir des conséquences graves pour la vie privée des individus, ainsi que pour la sécurité et la réputation des organisations. \nVol d’informations, une attaque MITM réussie peut conduire au vol d'informations sensibles, telles que des identifiants de connexion, des informations bancaires, des données personnelles ou des secrets commerciaux. \nCes informations peuvent être utilisées à des fins malveillantes, telles que le vol d'identité, la fraude financière ou le chantage. \nFraude financière, les attaques MITM peuvent être utilisées pour manipuler des transactions financières, modifier des factures, détourner des fonds ou accéder illégalement à des comptes bancaires. \nCela peut entraîner des pertes financières importantes pour les individus et les entreprises.")
                TypeText(titreDesProblemes: "•Protection", couleurDesTitres: .blue, textDesProblèmes: "Pour se protéger contre les attaques MITM (Man-in-the-Middle), la première étape consiste à chiffrer les communications pour éviter que des données sensibles ne soient interceptées ou modifiées. \nUtilisez des protocoles sécurisés tels que HTTPS pour les sites web, TLS pour le courrier électronique, et des VPN pour les connexions distantes. \nL'authentification mutuelle des parties qui communiquent est également essentielle. \nCela peut être réalisé via des certificats numériques qui valident l'identité des serveurs et des clients, garantissant que vous communiquez avec la personne ou l'entité que vous pensez être. \nÉvitez les connexions à des réseaux Wi-Fi publics ou non sécurisés, qui sont souvent ciblés par des attaquants MITM. \nSi vous devez utiliser des connexions publiques, assurez-vous de le faire via un VPN. \nDe plus, activez l'authentification à deux facteurs (2FA) pour vos comptes critiques, afin de limiter l'impact potentiel des attaques MITM sur l'usurpation d'identité. \nEnfin, éduquez vos utilisateurs et employés sur les risques liés aux attaques MITM, comme les signes de certificats SSL invalides ou les avertissements de sécurité, pour qu'ils soient alertes et prennent les précautions nécessaires. \nEn combinant ces mesures, vous pouvez réduire le risque d'être victime d'une attaque MITM et protéger l'intégrité et la confidentialité de vos communications.")
                
            }
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Text("MITM")
                    .bold()
                    .foregroundStyle(.black)
                    .font(.title)
            }
        }
    }
}

#Preview {
    Mitm()
}
