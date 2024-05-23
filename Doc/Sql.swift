//
//  Sql.swift
//  NetNinja
//
//  Created by apprenant64 on 03/05/2024.
//

import SwiftUI

struct Sql: View {
    var body: some View {
        VStack  {
            ScrollView {
                TypeText(titreDesProblemes: "•Description", couleurDesTitres: .black, textDesProblèmes: "Une attaque par injection SQL (Structured Query Language) est une forme courante d'attaque informatique qui vise à exploiter les vulnérabilités des applications Web ou des systèmes de gestion de bases de données (SGBD) qui utilisent le langage SQL pour communiquer avec la base de données. \nCette attaque permet à un attaquant d'injecter du code SQL malveillant dans une requête SQL, ce qui peut compromettre la sécurité et l'intégrité des données stockées dans la base de données.")
                TypeText(titreDesProblemes: "•Risques", couleurDesTitres: .red, textDesProblèmes: "Vol de données, les attaques par injection SQL peuvent permettre à un attaquant de récupérer des données sensibles stockées dans une base de données, telles que des informations personnelles, des identifiants de connexion, des informations financières, ou d'autres données confidentielles. \nSuppression des données, un attaquant peut utiliser une injection SQL pour altérer ou supprimer des données dans la base de données, compromettant ainsi l'intégrité des données stockées. \nCela peut entraîner des pertes de données, des dommages aux systèmes et des conséquences graves pour les utilisateurs ou les organisations qui dépendent de ces données. \nContournement des mécanismes d’authentification, les attaques par injection SQL peuvent permettre à un attaquant de contourner les mécanismes d'authentification et d'accéder à des comptes utilisateur ou à des fonctionnalités restreintes sans autorisation. \nCela peut conduire à des activités malveillantes telles que la prise de contrôle de comptes, l'usurpation d'identité, ou l'accès non autorisé à des ressources sensibles.")
                TypeText(titreDesProblemes: "•Conséquences", couleurDesTitres: .orange, textDesProblèmes: "Pertes financières, les entreprises peuvent subir des pertes financières importantes en raison des attaques par injection SQL, que ce soit en raison de vols de données, de pertes de clients, de frais de récupération ou de réparations, ou de réparations de la réputation endommagée. \nViolation de la confidentialité, les attaques par injection SQL peuvent entraîner des violations de la confidentialité des données, compromettant la sécurité et la confidentialité des informations personnelles ou sensibles des utilisateurs. \nPerte de confiance des utilisateurs, les utilisateurs peuvent perdre confiance dans une organisation qui a été victime d'une attaque par injection SQL, surtout si leurs données personnelles ou financières ont été compromises. \nCela peut entraîner une diminution de la fidélité à la marque et une augmentation du churn des clients.")
                TypeText(titreDesProblemes: "•Protection", couleurDesTitres: .blue, textDesProblèmes: "Pour se protéger contre les attaques par injection SQL, la clé est de sécuriser le code des applications Web et de limiter les vulnérabilités dans les bases de données. \nUtilisez des requêtes paramétrées (ou préparées) et des procédures stockées au lieu de concaténer des chaînes de requêtes SQL, ce qui empêche les attaquants d'insérer du code malveillant. \nAssurez-vous que vos applications et bases de données ont des contrôles d'accès stricts et des permissions limitées, en appliquant le principe du moindre privilège pour limiter les risques. \nLes pare-feux d'applications Web (WAF) peuvent détecter et bloquer des modèles d'attaque courants, ajoutant ainsi une couche de protection supplémentaire. \nLa validation et l'assainissement des entrées utilisateur sont essentiels : assurez-vous que toutes les données entrantes sont correctement vérifiées pour éviter les entrées non désirées ou dangereuses. \nEnfin, effectuez des tests de pénétration réguliers pour identifier les vulnérabilités potentielles dans votre système et assurez-vous de les corriger rapidement. \nEn combinant ces mesures, vous pouvez réduire considérablement le risque d'attaque par injection SQL et protéger vos données et systèmes contre des dommages potentiels.")
                
            }
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Text("SQL")
                    .bold()
                    .foregroundStyle(.black)
                    .font(.title)
            }
        }
    }
}

#Preview {
    Sql()
}
