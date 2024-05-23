//
//  Profil.swift
//  NetNinja
//
//  Created by apprenant64 on 02/05/2024.
//

import SwiftUI

struct Profil: View {
    
    @ObservedObject var user = monUser

    
    var body: some View {
        if user.modaleConnected == true {
            ProfileConnect()
        }else {
            ProfileNoConnect()
        }
    }
}


#Preview {
    Profil()
}
