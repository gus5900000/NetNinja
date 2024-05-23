//
//  LikeAnimated.swift
//  NetNinja
//
//  Created by apprenant64 on 03/05/2024.
//

import SwiftUI


struct Fav: View {
    @ObservedObject var viewModel: FavArticles
    var articleID: UUID
    var isFavorite: Bool {
        viewModel.articles.first { $0.id == articleID }?.isLiked ?? false
    }

    var body: some View {
        Button {
            withAnimation {
                viewModel.addLike(for: articleID)
            }
        } label: {
            Label("", systemImage: isFavorite ? "heart.fill" : "heart")
        }
        .foregroundColor(!isFavorite ? Color.blue : Color.red)
        .contentTransition(.symbolEffect(.replace))
        .font(.largeTitle)
    }
}


