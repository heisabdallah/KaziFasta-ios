//
//  CategoryView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 08/10/2023.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    var category: Category
    var body: some View {
        VStack {
            Header_CategoryView(category: category).padding(.vertical)
            ScrollView {
//                ForEach(Users, id: \.id){user in
//                    ForEach(user.profile.skills, id: \.self){skill in
//                        if skill.lowercased() == category.name.lowercased() {
//                            NavigationLink(destination: ProfileView(user: user).environmentObject(favoriteManager), label: {
//                                FreelancerProfileOverviewTile(user: user).padding(.horizontal)
//                            })
//                        }
//                    }
//                }
            }
        }.navigationBarBackButtonHidden().background(Color.theme.primaryColor).foregroundStyle(Color.theme.primaryText)
        
    }
}

#Preview {
    CategoryView(category: Category(image: "image", name: "category"))
}
