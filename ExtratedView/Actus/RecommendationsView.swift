//
//  RecommendationsView.swift
//  Day1
//
//  Created by apprenant64 on 02/05/2024.
//

import SwiftUI

struct RecommendationsView: View {
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Text("Nos recommandations")
                    .bold()
                    .font(.title2)
                    .padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 20) {
                        ForEach(tabRecommented) { recommended in
                            VStack(alignment: .leading, spacing: 0) {
                                ZStack(alignment: .topTrailing) {
                                    Image(systemName: recommended.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 126,height: 125)
                                        .padding(.horizontal, 67)
                                        .background(Color(red: 0.92, green: 0.95, blue: 1))
                                        .roundedCorner(20, corners: [.topLeft, .topRight])
                                    Text(recommended.dateOfPublish)
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 6)
                                        .background(Color.blue)
                                        .cornerRadius(12)
                                        .padding([.top, .trailing], 5)
                                }
                                ZStack(alignment: .bottom) {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(recommended.name)
                                            .bold()
                                            .foregroundColor(.black)
                                            .lineLimit(2)

                                        Text(recommended.location)
                                            .foregroundStyle(.gray)
                                    }
                                    .frame(width: 250, height: 150, alignment: .topLeading)
                                    .padding(.top, 10)
                                    .padding(.leading, 10)
                                    .background(Color(red: 0.7, green: 0.86, blue: 1))
                                    .roundedCorner(20, corners: [.bottomLeft, .bottomRight])
                                    
                                    NavigationLink(destination: DetailViewRecommanted(recommanted: recommended)) {
                                        HStack {
                                            Text("Afficher plus")
                                                .bold()
                                            Image(systemName: "plus.magnifyingglass")

                                        }
                                        .padding()
                                        .frame(width: 200)
                                        .foregroundColor(.blue)
                                        .background(Color.white)
                                        
                                        .cornerRadius(15)
                                        .padding(10)
                                        .shadow(radius: 5)

                                    }
                                }
                            }
                            
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
        
    }
}


struct DetailViewRecommanted: View {
    
    var recommanted: Recommanted

    var body: some View {
        ScrollView {

            VStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 375, height: 246)
                    .background(
                        Image(systemName: recommanted.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 375, height: 246)
                    )
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text("Dernière actu \(recommanted.name)")
                            .bold()
                            .font(.title2)
                            .padding(10)
                        Spacer()
                    }
                    Text(recommanted.content)
                        .padding(10)
                        .font(.title3)
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 10)
                .background(Color(red: 0.92, green: 0.95, blue: 1))
                .padding([.leading, .trailing], 5)
            }
        }.navigationBarTitle("Actualités")
    }
}



#Preview {
    RecommendationsView()
}
