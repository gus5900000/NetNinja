
import SwiftUI


struct Quiz: View {
    // Déclaration variables simples
    var titleNav: String
    var text_question: String
    // Déclaration variables d'état
    @State var boutonClick = false
    @State var modaleafficher = true
    @Binding var isValidationClicked: Bool   // Vérifie si le bouton n'est pas cliquables
    @State var BorderBouton = false
    @State var isModalPresented = false

    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(text_question)
                            .bold()
                            .foregroundStyle(.gray)
                    }
                }
                .padding()
                .navigationTitle(titleNav)
                
                if !isValidationClicked && !boutonClick {
                    // Boutons COMPOSANT répétés 4 FOIS
                    Composant_Bouton(textBoutonClick: answerQuiz[0], color_bouton: .colorBleu, isValidationClicked: false)
                    Composant_Bouton(textBoutonClick: answerQuiz[1], color_bouton: .colorBleu, isValidationClicked: false)
                    Composant_Bouton(textBoutonClick: answerQuiz[2], color_bouton: .colorBleu, isValidationClicked: false)
                    Composant_Bouton(textBoutonClick: answerQuiz[3], color_bouton: .colorBleu, isValidationClicked: false)
                   
                }
                
                if boutonClick {
                    // Boutons COMPOSANT répétés 4 FOIS
                    Composant_Bouton(textBoutonClick: answerQuiz[0], color_bouton: .colorResponse, isValidationClicked: false)
                    Composant_Bouton(textBoutonClick: answerQuiz[1], color_bouton: .colorAnswer, isValidationClicked: false)
                    Composant_Bouton(textBoutonClick: answerQuiz[2], color_bouton: .colorResponse, isValidationClicked: false)
                    Composant_Bouton(textBoutonClick: answerQuiz[3], color_bouton: .colorResponse, isValidationClicked: false)
                    // Importation du modal
                    Modale(isModalPresented: self.isModalPresented, textExplication: textExplicationQuiz)
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
                        }
                    }
                    .padding()
                    .background(.green)
                    .cornerRadius(10)
                    .disabled(isValidationClicked)
                }
            }
        }
    }
}

#Preview {
    Quiz(titleNav: "Quiz Quotidien ",text_question: "Question ?", isValidationClicked: .constant(false))
}

// COMPOSANT Bouton
struct Composant_Bouton: View {
    // Variables simples
    var textBoutonClick: String
    var color_bouton: Color
    var isValidationClicked: Bool
    
    // Variable d'état @State
    @State var BorderBouton = false
    
    var body: some View {
        Button(action: {
            BorderBouton.toggle()
        }) {
            HStack {
                Image(systemName: "checkmark.circle.badge.questionmark")
                    .foregroundStyle(.white)
                VStack(alignment: .leading, spacing: 0) {
                    Text(textBoutonClick)
                        .frame(width: 230)
                        .foregroundStyle(.white)
                        .bold()
                        .font(.system(size: 15))
                }
            }
        }
        .padding()
        .background(color_bouton)
        .border(BorderBouton ? Color.green : Color.clear, width: 6)
        .disabled(isValidationClicked)
        .cornerRadius(10)
    }
}

