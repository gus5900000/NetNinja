//
//  QuestionnaireView.swift
//  NetNinja
//
//  Created by apprenant58 on 02/05/2024.
//

import SwiftUI

struct Questionnaire: View {
    
    @State var role: String?
    @State var appareils: String = ""
    @State var hasAntivirus: Bool?
    @State var hasBeenAttacked: Bool?
    @State var securityKnowledgeLevel: Int?
    @State var inquietude: String = ""
    @State var espere: String = ""
    @State var isValidationSuccessful: Bool = false
    @ObservedObject var user = monUser

    
    var body: some View {
        
        
        ScrollView {
            VStack {
                introductoryText()
                chooseRoleSection()
                enterDevicesSection()
                antivirusQuestionSection()
                attackExperienceSection()
                knowledgeLevelSection()
                inquietudes()
                esperes()
                validation()
                
            }
            .padding()
        }
    }
    
    
    func introductoryText() -> some View {
        Text("Répondez à notre questionnaire pour mieux vous connaître.")
            .foregroundStyle(.gray)
            .padding(.bottom, 15)
    }
    
    func chooseRoleSection() -> some View {
        VStack {
            Text("Êtes-vous un particulier ou un professionnel ?").bold().font(.system(size: 19))
            HStack {
                RoleButton(text: "Particulier", isSelected: role == "Particulier") {
                    role = "Particulier"
                }
                RoleButton(text: "Professionnel", isSelected: role == "Professionnel") {
                    role = "Professionnel"
                }
            }
            .padding(.bottom, 30)
        }
    }
    
    func enterDevicesSection() -> some View {
        VStack {
            Text("Quels appareils utilisez-vous ?").bold().font(.system(size: 19))
            TextField("...", text: $appareils).padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 2).padding()
        }
    }
    
    func antivirusQuestionSection() -> some View {
        questionSection(
            question: "Avez-vous déjà un anti-virus ?",
            yesSelected: hasAntivirus == true,
            noSelected: hasAntivirus == false,
            yesAction: { hasAntivirus = true },
            noAction: { hasAntivirus = false }
        )
    }
    
    func attackExperienceSection() -> some View {
        questionSection(
            question: "Avez-vous déjà subi une attaque ?",
            yesSelected: hasBeenAttacked == true,
            noSelected: hasBeenAttacked == false,
            yesAction: { hasBeenAttacked = true },
            noAction: { hasBeenAttacked = false }
        )
    }
    
    func knowledgeLevelSection() -> some View {
        VStack {
            Text("Sur une échelle de 1 à 10, comment évalueriez-vous votre niveau de connaissance en cybersécurité ?")
                .bold().font(.system(size: 19))
            HStack {
                ForEach(1...10, id: \.self) { number in
                    NumberButton(number: number, isSelected: securityKnowledgeLevel == number) {
                        securityKnowledgeLevel = number
                    }
                }
            }
            .padding(.bottom, 30)
        }
    }
    
    
    func RoleButton(text: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
                .padding()
                .background(isSelected ? Color.green : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
        }
    }
    
    func questionSection(question: String, yesSelected: Bool, noSelected: Bool, yesAction: @escaping () -> Void, noAction: @escaping () -> Void) -> some View {
        VStack {
            Text(question).bold().font(.system(size: 19))
            HStack {
                RoleButton(text: "Oui", isSelected: yesSelected, action: yesAction)
                RoleButton(text: "Non", isSelected: noSelected, action: noAction)
            }
            .padding(.bottom, 30)
        }
    }
    
    func NumberButton(number: Int, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text("\(number)")
                .frame(width: 28, height: 28)
                .background(isSelected ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(14)
        }
    }
    
    func inquietudes() -> some View {
        VStack {
            Text("Quelles sont vos principales inquiétudes concernant votre sécurité en ligne ?").bold().font(.system(size: 19))
            TextField("...", text: $inquietude).padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 2).padding()
        }
    }
    
    func esperes() -> some View {
        VStack {
            Text("Qu’espérez-vous apprendre ou améliorer grâce à cette application ?").bold().font(.system(size: 19))
            TextField("...", text: $espere).padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 2).padding()
        }
    }
  
    func validation() -> some View {
        Button(action: {
            
            isValidationSuccessful = true
            user.modaleConnected = true
            user.modaleRegister = false
        }) {
            Text("Valider")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(15).shadow(radius: 5)
        }
        .padding(.bottom, 30)
        .fullScreenCover(isPresented: $isValidationSuccessful) {
            
            MaTabBar()
        }
    }
 
}

struct Questionnaire_Previews: PreviewProvider {
    static var previews: some View {
        Questionnaire()
    }
}
