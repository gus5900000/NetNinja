//
//  ProfileAvatar.swift
//  NetNinja
//
//  Created by apprenant64 on 13/05/2024.
//

import SwiftUI
import PhotosUI

struct ProfileAvatar: View {
    
    @Binding var avatarItem: PhotosPickerItem?
    @Binding var avatarImage: Image?
    
    var body: some View {
        VStack {
            if avatarImage == nil {
                Image(.profile)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.red)
                    .font(.system(size: 100))
                    .frame(width: 100, height: 100)
            } else {
                avatarImage?
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.red)
                    .font(.system(size: 100))
                    .frame(width: 100, height: 100)
            }
        }.onChange(of: avatarItem) {
            Task {
                if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                    avatarImage = loaded
                }
            }
        }
        
    }
}
