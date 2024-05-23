//
//  LastActuView.swift
//  Day1
//
//  Created by apprenant64 on 02/05/2024.
//

import SwiftUI

struct LastActuView: View {
    
    @Binding var selectedCategory: Tag
    @ObservedObject var viewModel: FavArticles

    var body: some View {
        
        HStack {
            Text("Dernière actualité ")
                .bold()
                .font(.title2)
            Spacer()
            
        }.padding(10)
        
        ForEach(filteredContents, id: \.id) { lastActu in
            NavigationLink(destination: DetailViewLastActu(lastActu: lastActu)) {
                HStack {
                    Image(systemName: lastActu.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                        .padding(.bottom, 10)
                    
                    VStack(alignment: .leading) {
                        Text(lastActu.name)
                            .bold()
                            .foregroundColor(.black)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        Text(lastActu.location)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                        .padding()
                        .padding([.bottom], 10)
                    
                }
                .padding(.top, 10)
                .padding(.leading, 10)
                .background(Color(red: 0.92, green: 0.95, blue: 1))
                .cornerRadius(10)
                .padding([.leading, .trailing], 5)
            }
        }
    } 
//    viewModel.articles.first { $0.id == articleID }?.isLiked ?? false

    var filteredContents: [LastActu] {
        if selectedCategory == .general {
            return tabLastActu
        } else if selectedCategory == .favorite {
            return viewModel.articles.filter { $0.isLiked }
        } else {
            return tabLastActu.filter { $0.tag == selectedCategory }
        }
    }
}

struct DetailViewLastActu: View {
    
    @EnvironmentObject var viewModel: FavArticles
    var lastActu: LastActu
    
    
    var body: some View {
        ScrollView {
            
            VStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 375, height: 246)
                    .background(
                        Image(systemName: lastActu.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 375, height: 246)
                    )
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text("Dernière actu \(lastActu.name)")
                            .bold()
                            .font(.title2)
                            .padding(10)
                        Spacer()
                        Fav(viewModel: viewModel, articleID: lastActu.id)
                    
                    }
                    
                    Text(lastActu.content)
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


struct RecommendationsView_Previews1: PreviewProvider {
    static var previews: some View {
        MaTabBar()
            .environmentObject(FavArticles(articles: tabLastActu))
    }
}

#Preview {
    PageActu()
}
