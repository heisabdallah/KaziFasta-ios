//
//  Header_HomeView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI

struct Header_HomeView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    @EnvironmentObject var profileVM: ProfileViewModel
    @EnvironmentObject var authVM: AuthViewModel
    var profile: Profile
    
    var body: some View {
            HStack{
                NavigationLink(destination: ProfileView(profile: profile ).environmentObject(authVM).environmentObject(profileVM).environmentObject(favoriteManager), label: {
                    Image("abdallah").resizable().scaledToFill().frame(width: 40, height: 40).clipShape(Circle())
                })
                
                Spacer()
                NavigationLink(destination: FavoritesView().environmentObject(profileVM).environmentObject(favoriteManager), label: {
                    Image(systemName: favoriteManager.favorites.isEmpty ? "heart": "heart.fill").padding(.horizontal).foregroundStyle(favoriteManager.favorites.isEmpty ? Color.theme.primaryText : .red)
                })
                
                Image(systemName: "line.3.horizontal").padding(.horizontal, 2)
            }.padding(.bottom, 20)
    }
}

//#Preview {
//    Header_HomeView().environmentObject(ProfileViewModel()).environmentObject(FavoriteManager())
//}
