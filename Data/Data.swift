//
//  Data.swift
//  Day1
//
//  Created by apprenant64 on 02/05/2024.
//

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct TypeText: View {
    
    var titreDesProblemes : String
    var couleurDesTitres : Color
    var textDesProblèmes : String
    
    
    var body: some View {
        Text(titreDesProblemes)
            .font(.title2)
            .bold()
            .padding([.leading],-190)
            .underline()
            .foregroundStyle(couleurDesTitres)
        Text(textDesProblèmes)
            .padding()
    }
    
}


struct rond_typeattaque: View {
    
    var text_rond: String
    var couleur_rond: LinearGradient
    
    
    var body: some View {
        Text(text_rond)
            .bold()
            .foregroundStyle(Color.white)
            .font(.system(size: 15))
            .foregroundColor(.clear)
            .frame(width: 97, height: 97)
            .background(couleur_rond)
            .cornerRadius(100)
    }
}

enum Tag: String, CaseIterable {
    case general = "Général",
         phising = "Phishing",
         ransomware = "Ransomware",
         ddos = "DDOS",
         mitm = "MITM",
         sql = "SQL",
         favorite = "Favoris"
}

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let tag: Tag
}

struct Recommanted: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let dateOfPublish: String
    let tag: Tag
    let content: String
    let image: String
    var isLiked: Bool = false
}

struct LastActu: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let dateOfPublish: String
    var tag: Tag
    let content: String
    let image: String
    var isLiked: Bool = false
}


class FavArticles: ObservableObject {
    
    @Published var articles: [LastActu]
    
    init(articles: [LastActu]) {
        self.articles = articles
    }
    
    func addLike(for articleID: UUID) {
        if let index = articles.firstIndex(where: { $0.id == articleID }) {
            articles[index].isLiked.toggle()
        }
    }
}


class User: ObservableObject {
    
    @Published var modaleStart: Bool
    @Published var modaleLogin: Bool
    @Published var modaleConnected: Bool
    @Published var modaleRegister: Bool
    
    
    init(modaleStart: Bool = true, modaleLogin: Bool = false, modaleConnected: Bool = false, modaleRegister: Bool = false) {
        self.modaleStart = modaleStart
        self.modaleLogin = modaleLogin
        self.modaleConnected = modaleLogin
        self.modaleRegister = modaleLogin
    }
    
}

var monUser = User()


//Variable qui permet de savoir si on est connecté
var statusConnect = String()

// Catégorie
var general = Category(name: "Général", tag: Tag.general)
var phishing = Category(name: "Phishing", tag: Tag.phising)
var ransomware = Category(name: "Ransomware", tag: Tag.ransomware)
var ddos = Category(name: "DDOS", tag: Tag.ddos)
var mitm = Category(name: "MITM", tag: Tag.mitm)
var sql = Category(name: "SQL", tag: Tag.sql)
var favorite = Category(name: "Favoris", tag: Tag.favorite)

var tabCategory = [general, favorite ,phishing, ransomware, ddos, mitm, sql]

var tabCategoryNoGeneral = [phishing, ransomware, ddos, mitm, sql]

// Article recommender

let Recommented1 = Recommanted(name: "Les menaces émergentes dans le domaine de l'intelligence artificielle", location: "Beijing, Chine 🇨🇳", dateOfPublish: "17 avril", tag: .general, content: "L'intelligence artificielle (IA) présente un énorme potentiel pour transformer de nombreux aspects de notre société, mais elle est également sujette à des abus et à des menaces. Les chercheurs en sécurité ont mis en garde contre les dangers potentiels de l'utilisation malveillante de l'IA, y compris les attaques automatisées, la manipulation de données et les deepfakes.\n\nPour contrer ces menaces, il est crucial de développer des techniques de détection et de prévention des attaques d'IA, ainsi que des normes éthiques et réglementaires pour encadrer son utilisation.", image: "bolt.heart.fill")

let Recommented2 = Recommanted(name: "Les cyberattaques contre les infrastructures critiques", location: "Washington D.C., USA 🇺🇸", dateOfPublish: "22 mars", tag: .general, content: "Les infrastructures critiques telles que les réseaux électriques, les systèmes de transport et les services d'urgence sont de plus en plus ciblées par des cyberattaques sophistiquées. Ces attaques peuvent avoir des conséquences dévastatrices, entraînant des pannes de service, des perturbations économiques et même des menaces à la sécurité nationale.\n\nPour renforcer la résilience des infrastructures critiques contre les cyberattaques, il est crucial d'investir dans des mesures de sécurité avancées telles que la surveillance continue, la détection des intrusions et la réponse aux incidents.", image: "building.columns")

let Recommented3 = Recommanted(name: "Les implications juridiques des attaques informatiques", location: "Brasília, Brésil 🇧🇷", dateOfPublish: "9 novembre", tag: .general, content: "Les attaques informatiques soulèvent des questions complexes en matière de responsabilité légale et de justice. Les victimes d'attaques peuvent chercher à poursuivre les auteurs en justice pour obtenir des réparations, mais l'identification et la poursuite des cybercriminels peuvent être extrêmement difficiles.\n\nDe plus, les lois sur la cybersécurité varient d'un pays à l'autre, ce qui peut compliquer les efforts de poursuite transfrontalière. Pour relever ces défis, les gouvernements du monde entier doivent collaborer pour développer des normes juridiques et des mécanismes de coopération internationale en matière de cybersécurité.", image: "scroll")




var tabRecommented = [Recommented1,Recommented2, Recommented3]


// Dernière actualité
let lastActu1 = LastActu(name: "Les dangers du phishing et comment s'en protéger", location: "New York, USA 🇺🇸", dateOfPublish: "15 mars", tag: .phising, content: "Le phishing est l'une des techniques d'attaque les plus courantes et les plus dangereuses utilisées par les cybercriminels. Il s'agit de l'envoi de courriels ou de messages frauduleux dans le but de tromper les destinataires et de les inciter à divulguer des informations personnelles telles que des mots de passe, des informations financières ou des données de carte de crédit. Les attaques de phishing peuvent avoir des conséquences désastreuses, y compris le vol d'identité, la fraude financière et la compromission de la sécurité des données.\n\nPour vous protéger contre le phishing, il est important d'être conscient des signes révélateurs d'une tentative de phishing, tels que des erreurs grammaticales ou orthographiques dans les messages, des liens suspects ou des demandes de renseignements personnels non sollicitées. En outre, il est recommandé d'utiliser des logiciels de sécurité fiables, de vérifier régulièrement vos comptes en ligne pour détecter toute activité suspecte et de ne jamais cliquer sur des liens ou télécharger des pièces jointes provenant de sources non fiables.", image: "envelope.open.fill")

let lastActu2 = LastActu(name: "La montée en puissance des attaques ransomware", location: "Londres, Royaume-Uni 🇬🇧", dateOfPublish: "20 avril", tag: .ransomware, content: "Les attaques ransomware sont devenues l'une des menaces les plus redoutées pour les entreprises et les particuliers du monde entier. Ces attaques sophistiquées chiffrent les fichiers de la victime et exigent le paiement d'une rançon en échange de la clé de déchiffrement. Les conséquences d'une attaque ransomware peuvent être dévastatrices, entraînant des pertes financières, une interruption des activités commerciales et une atteinte à la réputation de l'entreprise.\n\nPour se protéger contre les attaques ransomware, il est essentiel de mettre en œuvre des mesures de sécurité robustes telles que la sauvegarde régulière des données, la mise à jour des logiciels et la sensibilisation des employés aux techniques de phishing et d'ingénierie sociale utilisées par les cybercriminels.", image: "lock.shield.fill")

let lastActu3 = LastActu(name: "Les vulnérabilités SQL et les risques pour les données", location: "Berlin, Allemagne 🇩🇪", dateOfPublish: "10 juin", tag: .sql, content: "Les bases de données SQL sont au cœur de nombreuses applications et systèmes informatiques, mais elles sont également vulnérables à diverses formes d'attaques et de failles de sécurité. Les attaquants peuvent exploiter ces vulnérabilités pour accéder, modifier ou supprimer des données sensibles, compromettant ainsi la confidentialité et l'intégrité des informations stockées.\n\nPour protéger vos bases de données SQL contre les attaques, il est important de mettre en œuvre des bonnes pratiques de sécurité telles que la limitation des privilèges d'accès, le cryptage des données sensibles et la surveillance continue de l'activité suspecte.", image: "swiftdata")

let lastActu4 = LastActu(name: "Les attaques DDoS et leurs conséquences sur les entreprises", location: "Tokyo, Japon 🇯🇵", dateOfPublish: "5 août", tag: .ddos, content: "Les attaques par déni de service distribué (DDoS) sont devenues monnaie courante dans le paysage de la cybersécurité, posant de graves problèmes aux entreprises et organisations du monde entier. Ces attaques visent à submerger les serveurs cibles de trafic malveillant, les rendant indisponibles pour les utilisateurs légitimes. Les conséquences d'une attaque DDoS peuvent inclure des temps d'arrêt du site Web, des pertes financières, des dommages à la réputation de l'entreprise et des interruptions des opérations commerciales.\n\nPour se protéger contre les attaques DDoS, les entreprises doivent mettre en place des solutions de protection robustes telles que les pare-feu, les systèmes de détection et de prévention des intrusions (IDS/IPS) et les services de mitigation de DDoS.", image: "network.badge.shield.half.filled")

let lastActu5 = LastActu(name: "Les nouvelles menaces de sécurité liées à l'IoT", location: "Sydney, Australie 🇦🇺", dateOfPublish: "18 septembre", tag: .mitm, content: "L'Internet des objets (IoT) offre de nombreux avantages en termes de connectivité et de commodité, mais il présente également de nouveaux défis en matière de sécurité. Les appareils IoT sont de plus en plus ciblés par les cybercriminels pour mener des attaques de l'homme du milieu (MITM) et d'autres formes d'exploitation.\n\nLes conséquences de ces attaques peuvent être graves, allant de l'accès non autorisé aux données personnelles à la prise de contrôle à distance des appareils. Pour sécuriser les appareils IoT, il est crucial de mettre en œuvre des protocoles de sécurité robustes, de garder les appareils à jour avec les derniers correctifs de sécurité et de limiter l'accès aux appareils aux utilisateurs autorisés uniquement.", image: "wifi.exclamationmark")

let lastActu6 = LastActu(name: "Les défis de la conformité RGPD pour les entreprises", location: "Paris, France 🇫🇷", dateOfPublish: "30 novembre", tag: .general, content: "Le Règlement général sur la protection des données (RGPD) est une réglementation de l'Union européenne qui vise à protéger les données personnelles des citoyens de l'UE. Il impose des exigences strictes en matière de collecte, de stockage et de traitement des données, ainsi que des sanctions sévères en cas de non-conformité.\n\nPour les entreprises, se conformer au RGPD peut être un défi majeur, nécessitant des investissements importants dans les technologies et les processus de conformité. Cependant, cela peut également offrir des avantages concurrentiels en renforçant la confiance des consommateurs et en améliorant la gestion des données.", image: "lock.shield")

let lastActu7 = LastActu(name: "L'importance de la sensibilisation à la sécurité pour les employés", location: "Berlin, Allemagne 🇩🇪", dateOfPublish: "25 octobre", tag: .general, content: "La sensibilisation à la sécurité est un élément essentiel de toute stratégie de cybersécurité, car les employés sont souvent la première ligne de défense contre les cybermenaces. Un personnel bien formé est moins susceptible de tomber victime de techniques de phishing, de télécharger des logiciels malveillants ou de divulguer des informations sensibles.\n\nPour renforcer la sensibilisation à la sécurité, les entreprises peuvent mettre en œuvre des programmes de formation réguliers, organiser des exercices de simulation d'attaques et fournir des ressources éducatives sur les meilleures pratiques de sécurité.", image: "person.3.fill")

let lastActu8 = LastActu(name: "Les techniques avancées des cybercriminels pour contourner la sécurité", location: "Moscou, Russie 🇷🇺", dateOfPublish: "3 juillet", tag: .ransomware, content: "Les cybercriminels utilisent constamment des techniques sophistiquées pour contourner les mesures de sécurité traditionnelles et compromettre les systèmes informatiques. Ces techniques incluent l'utilisation de logiciels malveillants furtifs, l'ingénierie sociale, les attaques ciblées et les vulnérabilités zero-day.\n\nPour se protéger contre ces menaces, il est crucial pour les entreprises de rester à jour avec les dernières tendances en matière de cybersécurité, de surveiller activement les activités suspectes sur leurs réseaux et de mettre en œuvre une approche multicouche de la sécurité informatique.", image: "lock.shield.fill")

let lastActu10 = LastActu(name: "Les défis de la sécurisation des réseaux Wi-Fi publics", location: "Barcelone, Espagne 🇪🇸", dateOfPublish: "12 septembre", tag: .general, content: "Les réseaux Wi-Fi publics sont omniprésents dans les lieux publics tels que les cafés, les aéroports et les hôtels, offrant un accès Internet gratuit et pratique pour les utilisateurs. Cependant, ils présentent également des risques de sécurité importants, car ils sont souvent mal sécurisés et vulnérables aux attaques de l'homme du milieu (MITM) et autres formes d'exploitation.\n\nPour sécuriser les réseaux Wi-Fi publics, il est recommandé d'utiliser des réseaux privés virtuels (VPN) pour crypter les communications, d'éviter de saisir des informations sensibles telles que les mots de passe et les informations de carte de crédit, et d'éviter de se connecter à des réseaux non sécurisés.", image: "wifi")





var tabLastActu = [lastActu1,lastActu2, lastActu3, lastActu4,lastActu5, lastActu6, lastActu7, lastActu8, lastActu10]


var questionQuiz = "Quelle est la signification de DDoS en matière de cybersécurité ?"

var answerQuiz = ["Demande de Données sur un Système", "Déni de Service Distribué", "Détection de Données Sécurisées", "Destruction de Données Sensibles"]

var textExplicationQuiz = """
Le terme DDoS fait référence à une attaque informatique dans laquelle un grand nombre de systèmes informatiques sont exploités simultanément pour envoyer des requêtes vers un serveur cible. L'objectif de cette attaque est de submerger le serveur cible avec un trafic réseau excessif, ce qui le rend indisponible pour les utilisateurs légitimes.

Le "Déni de Service" fait référence à la privation de service pour les utilisateurs légitimes, car le serveur surchargé ne peut pas répondre à leurs demandes. Le terme "Distribué" indique que l'attaque provient de multiples sources, souvent des ordinateurs zombies infectés par des logiciels malveillants et contrôlés à distance par un attaquant.
"""
