//
//  TabBar.swift
//  Day1
//
//  Created by Micael on 26/04/2024.
//

import SwiftUI

struct View1: View { //LA STRUCTURE DE MA PAGE ACTUALITÉS (C'EST PAS CHATGPT AUGUSTIN)
    var body: some View {
        Text("L'accueil des actualités de NetNinja")
    }
}
struct View2: View { // LA STRUCTURE DE MA PAGE QUIZ (C'EST PAS CHATGPT AUGUSTIN)
    var body: some View {
        Text("Quizz")
    }
}
struct View3: View { // LA STRUCTURE DE MA PAGE ATTAQUE (C'EST PAS CHATGPT AUGUSTIN)
    var body: some View {
        Text("Attaque")
    }
}
struct View4: View { // LA STRUCTURE DE MA PAGE PROFIL (C'EST PAS CHATGPT AUGUSTIN)
    var body: some View {
        Text("Profil")
    }
}

struct MaTabBar: View {
    
    @ObservedObject var user = monUser
    
    var body: some View {
        TabView {
            PageActu()
                .tabItem {  // LE LOGO ET LE TITRE DE MA TABBAR ACTUALITÉS (C'EST PAS CHATGPT AUGUSTIN)
                
                    Label ("Actualité", systemImage:  "book.fill")
                }
            Quiz(titleNav: "Quiz Quotidien ",text_question: questionQuiz, isValidationClicked: .constant(false))
                .tabItem {  // LE LOGO ET LE TITRE DE MA TABBAR QUIZ (C'EST PAS CHATGPT AUGUSTIN)
                    Label ("Quiz", systemImage:  "pencil")
                }
            Attaque()
                .tabItem { // LE LOGO ET LE TITRE DE MA TABBAR ATTAQUE (C'EST PAS CHATGPT AUGUSTIN)
                    Label ("Attaque", systemImage:  "doc")
                }
            Profil()
                .tabItem { // LE LOGO ET LE TITRE DE MA TABBAR PROFIL (C'EST PAS CHATGPT AUGUSTIN)
                    Label ("Profil", systemImage:  "person")
                }
            
        }.fullScreenCover(isPresented: $user.modaleStart) {
            OnboardingView()
        }
        .fullScreenCover(isPresented: $user.modaleLogin) {
            Login()
        }
        .fullScreenCover(isPresented: $user.modaleRegister) {
            EnregistreToi()
        }
        
        
    }
}

#Preview {
    MaTabBar()
}
