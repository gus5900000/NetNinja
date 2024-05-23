//
//  PageActu.swift
//  Day1
//
//  Created by apprenant64 on 30/04/2024.
//

import SwiftUI


// Nom des Tab "tabCategory", "tabRecommented", "tabLastActu"
struct PageActu: View {

    @State var selectedCategory: Tag = .general
    @EnvironmentObject var viewModel: FavArticles
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    CategorieFilter(selectedCategory: $selectedCategory, tabCategorie: tabCategory)
                    RecommendationsView()
                    LastActuView(selectedCategory: $selectedCategory, viewModel: viewModel)
                }
            }
            .navigationBarTitle("Actualités", displayMode: .inline)
        }
    }
}

//#Preview {
//    MaTabBar()
//}



struct RecommendationsView_Previews: PreviewProvider {
    static var previews: some View {
        MaTabBar()
            .environmentObject(FavArticles(articles: tabLastActu))
    }
}
