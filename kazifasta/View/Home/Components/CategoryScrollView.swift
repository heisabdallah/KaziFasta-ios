//
//  CategoryScrollView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI

struct CategoryScrollView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(content: {
                ForEach(popularCategories, id: \.self) { category in
                    ForEach(Users, id: \.id){user in
                        if user.profile.category == category {
                                NavigationLink(destination: {
                                    ProfileView(user: user).environmentObject(favoriteManager)
                                }, label: {
                                    TextCapsule(text: category)
                                })
                        }
                    }
                }
            }).padding(.horizontal)
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    CategoryScrollView()
}
