//
//  FavoritesView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 12/10/2023.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    let columns = [
        GridItem(.flexible(), spacing: 20, alignment: .leading),
    ]
    var body: some View {
        VStack{
            Header_FavoritesView()
            
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(favoriteManager.favorites, id: \.id){favUser in
                        NavigationLink(destination: ProfileView(user: favUser).environmentObject(favoriteManager), label: {
                            FreelancerProfileOverviewTile(user: favUser)
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
