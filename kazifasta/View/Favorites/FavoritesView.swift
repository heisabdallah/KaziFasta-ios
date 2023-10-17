//
//  FavoritesView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 12/10/2023.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    @EnvironmentObject var profileVM: ProfileViewModel
    let columns = [
        GridItem(.flexible(), spacing: 20, alignment: .leading),
    ]
    var body: some View {
        VStack{
            Header_FavoritesView()
            
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(favoriteManager.favorites, id: \.id){profile in
                        NavigationLink(destination: ProfileView(profile: profile).environmentObject(profileVM).environmentObject(favoriteManager), label: {
                            FreelancerProfileOverviewTile(profile: profile)
                        })
                    }
                }).padding([.horizontal])
            }.scrollIndicators(.hidden)
        }.ignoresSafeArea(edges: .bottom).background(Color.theme.primaryColor).foregroundStyle(Color.theme.primaryText)
            .navigationBarBackButtonHidden()
    }
}

#Preview {
    FavoritesView()
}
