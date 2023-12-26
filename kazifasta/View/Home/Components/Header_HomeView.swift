//
//  Header_HomeView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI
import CachedAsyncImage

struct Header_HomeView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    @EnvironmentObject var profileVM: ProfileViewModel
    @EnvironmentObject var authVM: AuthViewModel
    var profile: Profile
    
    var body: some View {
            HStack{
                NavigationLink(destination: ProfileView(profile: profile ).environmentObject(authVM).environmentObject(profileVM).environmentObject(favoriteManager), label: {
                    CachedAsyncImage(url: URL(string: profile.avatarImage ?? avatarPH)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 40, height: 40)
                        .background(Color.gray)
                        .clipShape(Circle())
                })
                
                Spacer()
                NavigationLink(destination: FavoritesView(profile: profile).environmentObject(authVM).environmentObject(profileVM).environmentObject(favoriteManager), label: {
                    Image(systemName: favoriteManager.favorites.isEmpty ? "heart": "heart.fill").padding(.horizontal).foregroundStyle(favoriteManager.favorites.isEmpty ? Color.theme.primaryText : .red)
                })
                
                Image(systemName: "line.3.horizontal").padding(.horizontal, 2)
            }.onAppear{
                Task{
                    profileVM.fetchProfile()
                    favoriteManager.fetchFavorites(userID: profile.user_id ?? "")
                }
            }.padding(.bottom, 20)
    }
}

//#Preview {
//    Header_HomeView().environmentObject(ProfileViewModel()).environmentObject(FavoriteManager())
//}
