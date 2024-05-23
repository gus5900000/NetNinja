//
//  modale.swift
//  Day1
//
//  Created by apprenant64 on 26/04/2024.
//

import SwiftUI

struct Modale: View {
    @State var isModalPresented = false
    var textExplication : String
    
    var body: some View {
        VStack {
            Button("Voir explication") {
                self.isModalPresented = true
            }
            .padding()
            .foregroundColor(.white)
            .bold()
            .background(.green)
            .cornerRadius(10)
            .padding()
        }
        .sheet(isPresented: $isModalPresented) {
            ModaleView(isModalPresented: self.$isModalPresented, textExplication: textExplication)
        }
    }
}

struct ModaleView: View {
    
    @Binding var isModalPresented: Bool
    var textExplication: String
    
    var body: some View {
        
        
        NavigationStack{
            VStack {
                Text("INFORMATION : ")
                    .underline()
                    .foregroundStyle(.gray)
                    .font(.title3)
                    .padding()
                Text(textExplication)
                    .bold()
                    .foregroundStyle(.black)
                    .padding()
                Spacer()
                Button("Retour") {
                    self.isModalPresented = false
                }
                .padding()
                .foregroundColor(.white)
                .bold()
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
            }.navigationTitle("Explication")
        }
    }
}

