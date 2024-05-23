//
//  CategorieFilter.swift
//  Day1
//
//  Created by apprenant64 on 02/05/2024.
//

import SwiftUI

struct CategorieFilter: View {
    
    @Binding var selectedCategory: Tag
    var tabCategorie: [Category] = []
    
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(tabCategorie) { category in
                        Button(action: {
                            selectedCategory = category.tag
                        })
                        {
                            Text(category.name)
                                .kerning(0.5)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 6)
                        .background(selectedCategory == category.tag ? Color.blue : Color.gray)
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}
