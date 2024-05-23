//
//  Attaque.swift
//  NetNinja
//
//  Created by apprenant64 on 03/05/2024.
//

import SwiftUI

struct Attaque: View {
    
    @State private var angleR: Angle = .zero
    @State var selectedCategory: Tag = .general
    @State  var angle: CGFloat = 0 // Contrôle de l'angle de rotation
    let angularSpeed: CGFloat = 0.1 // Vitesse de rotation par geste
    let itemSize: CGFloat = 30 // Taille des éléments
    let radius: CGFloat = 150 // Rayon de la roue
    
    var body: some View {
        NavigationStack { //Pour pouvoir nav sur d'autres écrans
            VStack  { //Stack pour les ronds
                Spacer()
                ZStack {
                    Circle()
                        .foregroundStyle(.white)
                    ZStack{
                        NavigationLink (destination: Mitm() ) {
                            rond_typeattaque(text_rond: "MITM", couleur_rond: LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 25 / 255, green: 78 / 255, blue: 162 / 255), location: 0), // Bleu foncé
                                    Gradient.Stop(color: Color(red: 42 / 255, green: 111 / 255, blue: 208 / 255), location: 1),
                                ],
                                startPoint: UnitPoint(x: 0.2, y: 0.1),
                                endPoint: UnitPoint(x: 0.82, y: 0.87)
                            )) // Rond pour MITM
                            .rotationEffect(-angleR)
                        }.position(x: 65 , y: 135)
                        
                        NavigationLink (destination: Phishing()) {
                            rond_typeattaque(text_rond: "Phishing", couleur_rond: LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 10 / 255, green: 32 / 255, blue: 64 / 255), location: 0.0),
                                    Gradient.Stop(color: Color(red: 20 / 255, green: 55 / 255, blue: 110 / 255), location: 1),
                                    
                                ],
                                startPoint: UnitPoint(x: 0.15, y: 0.85),
                                endPoint: UnitPoint(x: 0.85, y: 0.15)
                            )) // Rond pour Phishing
                            .rotationEffect(-angleR)
                        }.position(x: 175 , y: 55)
                        
                        
                        NavigationLink (destination: Sql() ) {
                            rond_typeattaque(text_rond: "SQL", couleur_rond:LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 59 / 255, green: 144 / 255, blue: 254 / 255), location: 0),  // Bleu moyen
                                    Gradient.Stop(color: Color(red: 88 / 255, green: 160 / 255, blue: 254 / 255), location: 1),
                                ],
                                startPoint: UnitPoint(x: 0, y: 0.53),
                                endPoint: UnitPoint(x: 0.97, y: 0.47)
                            )) // Rond pour SQL
                            .rotationEffect(-angleR)
                        }.position(x: 110 , y: 265 )
                        
                        NavigationLink (destination:Ransomware()) {
                            rond_typeattaque(text_rond: "Ransomware", couleur_rond:LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 133 / 255, green: 176 / 255, blue: 190 / 255), location: 0),
                                    Gradient.Stop(color: Color(red: 137 / 255, green: 170 / 255, blue: 215 / 255), location: 1.00)
                                ],
                                startPoint: UnitPoint(x: 0, y: 0.49),
                                endPoint: UnitPoint(x: 1, y: 0.53)
                            )) // Rond pour le Ransomware
                            .rotationEffect(-angleR)
                        }.position(x: 285 , y: 135)
                        
                        NavigationLink (destination: Ddos() ) {
                            rond_typeattaque(text_rond: "DDOS", couleur_rond:LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 118 / 255, green: 177 / 255, blue: 254 / 255), location: 0), // Bleu clair
                                    Gradient.Stop(color: Color(red: 145 / 255, green: 196 / 255, blue: 254 / 255), location: 1),
                                ],
                                startPoint: UnitPoint(x: 0.51, y: 1),
                                endPoint: UnitPoint(x: 0.51, y: 0)
                            )) //Rond pour DDOS
                            .rotationEffect(-angleR)
                        }.position(x: 245 , y: 265)
                    }.frame(width: 350, height: 350)
                }
                .frame(width: 500)
                .rotationEffect(angleR)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            // Calculate rotation based on the drag position.
                            // Here, atan2 is used to calculate the angle of rotation from the center of the view.
                            angleR = Angle(degrees: Double(atan2(gesture.translation.height, gesture.translation.width)) * 180 / .pi)
                        }
                )
                .background(.white)
                
                
                Spacer().frame(height: 40)
                
                
                NavigationLink (destination: QuestionnaireTypeAttaque(selectedCategory: .phising)) {
                    Text("Questionnaire")
                    
                        .frame(width: 230, height: 80)
                        .font(.title)
                        .foregroundStyle(.white)
                        .background(.colorBleu)
                        .cornerRadius(15)
                        .padding()
                        .bold()
                }
                Spacer()
            }.navigationBarTitle("Types d'attaques")
        }
    }
    
}

struct QuestionnaireTypeAttaque: View {
    
    @State var selectedCategory: Tag = .phising
    
    
    var body: some View {
        
        
        
        NavigationStack {
            CategorieFilter(selectedCategory: $selectedCategory, tabCategorie: tabCategoryNoGeneral)
            
            ScrollView {
                switch selectedCategory {
                case .phising:
                    EcranFish(titleNav: "", text_question: "", isValidationClicked: .constant(false))
                case .ransomware:
                    EcranRansom(titleNav: "", text_question: "", isValidationClicked: .constant(false))
                case .ddos:
                    EcranDDOS(titleNav: "", text_question: "", isValidationClicked: .constant(false))
                case .sql:
                    EcranSQL(titleNav: "", text_question: "", isValidationClicked: .constant(false))
                case .mitm:
                    EcranMITM(titleNav: "", text_question: "", isValidationClicked: .constant(false))
                case .general:
                    Text("ça marche pas")
                case .favorite:
                    Text("ça marche pas")
                }
                
            }.navigationTitle("Questionnaire")
        }
    }
}

#Preview {
    QuestionnaireTypeAttaque()
}


#Preview {
    Attaque()
}
