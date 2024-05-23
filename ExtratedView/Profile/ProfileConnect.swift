//
//  ProfileConnect.swift
//  NetNinja
//
//  Created by apprenant64 on 10/05/2024.
//

import SwiftUI
import PhotosUI

struct ProfileConnect: View {
    
    @State var avatarItem: PhotosPickerItem?
    @State var avatarImage: Image?
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                VStack {
                    ZStack {
                        VStack {
                            ProfileAvatar(avatarItem: $avatarItem, avatarImage: $avatarImage)
                        }
                        HStack {
                            Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            VStack {
                                PhotosPicker(selection: $avatarItem, matching: .images, label: {
                                    Image(systemName: "pencil.circle.fill")
                                })
                            }
                            .background(Color.white)
                            .cornerRadius(12.5)
                            .padding()
                        }
                    }
                }
                ProfileName(showAlert: false)
                Text("Particulier/Pro")
                    .frame(width: 110,height: 10)
                    .foregroundStyle(.black)
                Spacer().frame(width:100,height:50)
                
                HStack{
                    Text("Modules :")
                        .font(.system(size: 24))
                        .underline()
                        .bold()
                        .padding()
                    Spacer()
                    
                }
                List_rondProfil(couleur_fondRond: LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 10 / 255, green: 32 / 255, blue: 64 / 255), location: 0.0),
                        Gradient.Stop(color: Color(red: 20 / 255, green: 55 / 255, blue: 110 / 255), location: 1),
                    ],
                    startPoint: UnitPoint(x: 0.15, y: 0.85),
                    endPoint: UnitPoint(x: 0.85, y: 0.15)
                ), text_rond: "Phishing")
                List_rondProfil(couleur_fondRond: LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 25 / 255, green: 78 / 255, blue: 162 / 255), location: 0), // Bleu foncé
                        Gradient.Stop(color: Color(red: 42 / 255, green: 111 / 255, blue: 208 / 255), location: 1),
                    ],
                    startPoint: UnitPoint(x: 0.15, y: 0.85),
                    endPoint: UnitPoint(x: 0.85, y: 0.15)
                ), text_rond: "MITM")
                List_rondProfil(couleur_fondRond: LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 59 / 255, green: 144 / 255, blue: 254 / 255), location: 0),  // Bleu moyen
                        Gradient.Stop(color: Color(red: 88 / 255, green: 160 / 255, blue: 254 / 255), location: 1),
                    ],
                    startPoint: UnitPoint(x: 0.15, y: 0.85),
                    endPoint: UnitPoint(x: 0.85, y: 0.15)
                ), text_rond: "SQL")
                List_rondProfil(couleur_fondRond: LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 118 / 255, green: 177 / 255, blue: 254 / 255), location: 0), // Bleu clair
                        Gradient.Stop(color: Color(red: 145 / 255, green: 196 / 255, blue: 254 / 255), location: 1),
                    ],
                    startPoint: UnitPoint(x: 0.15, y: 0.85),
                    endPoint: UnitPoint(x: 0.85, y: 0.15)
                ), text_rond: "DDOS")
                List_rondProfil(couleur_fondRond: LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 133 / 255, green: 176 / 255, blue: 190 / 255), location: 0),
                        Gradient.Stop(color: Color(red: 137 / 255, green: 170 / 255, blue: 215 / 255), location: 1.00)
                    ],
                    startPoint: UnitPoint(x: 0.15, y: 0.85),
                    endPoint: UnitPoint(x: 0.85, y: 0.15)
                ), text_rond: "Ransomware")
            }
            .navigationBarItems(trailing: Button(action: {
            }) {
                NavigationLink(destination: SettingProfile() ){
                    Image(systemName: "gearshape")
                }
            })
            .navigationBarTitle("Profil", displayMode: .inline)
            
        }
    }
}

struct List_rondProfil: View {
    
    var couleur_fondRond:LinearGradient
    var text_rond: String
    
    var body: some View {
        VStack {
            HStack {
                ZStack{
                    Circle()
                        .foregroundStyle(couleur_fondRond)
                        .frame(width:100, height: 120)
                    Text(text_rond)
                        .font(.system(size: 15))
                        .foregroundStyle(.white)
                        .bold()
                }
                VStack {
                    
                    VStack {
                        Text("Risque")
                            .bold()
                            .padding(.trailing,190)
                        
                        Rectangle()
                            .frame(width: 250,height: 10)
                            .foregroundStyle(.red)
                            .cornerRadius(4)
                    }
                    
                    VStack {
                        Text("Progression")
                            .bold()
                            .padding(.trailing,150)
                        
                        
                        
                        Rectangle()
                            .frame(width: 100,height: 10)
                            .foregroundStyle(.blue)
                            .cornerRadius(4)
                            .padding(.trailing,150)
                    }
                }
            }
        }
    }
}


struct TApas2photo: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Text("Change pas de photo toi !")
                .font(.system(size: 80, weight: .bold, design: .default))
                .foregroundColor(.red)
            
        }
    }
}


#Preview {
    ProfileConnect()
}
