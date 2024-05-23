//
//  NetNinjaApp.swift
//  NetNinja
//
//  Created by apprenant64 on 02/05/2024.
//

import SwiftUI

@main
struct NetNinjaApp: App {
    
    @StateObject var favArticles = FavArticles(articles: tabLastActu)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favArticles)
        }
    }
}
