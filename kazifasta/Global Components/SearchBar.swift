//
//  SearchBar.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI

struct SearchBar: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    @State private var searchText: String = ""
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "magnifyingglass.circle.fill")
            TextField("Search", text: $searchText)
            Image(systemName: "slider.horizontal.3")
        }.padding().foregroundStyle(Color.theme.primaryText).background(Color.theme.buttonColor).clipShape(.rect(cornerRadius: 15))
        
//        if !searchText.isEmpty {
//            ScrollView(showsIndicators: false) {
//                VStack(alignment: .leading) {
//                    ForEach(users.filter { user in
//                        // Check your condition here. For example:
//                        if searchText.isEmpty {
//                            return false // Display no items when searchTEC is empty
//                        } else {
//                            // Replace this condition with your filtering logic
//                            // It should return true for items you want to display
//                            return user.profile.category.localizedCaseInsensitiveContains(searchText) || user.profile.name.localizedCaseInsensitiveContains(searchText) || user.profile.title!.localizedCaseInsensitiveContains(searchText)
//                        }
//                    }, id: \.id) { user in
//                        NavigationLink(destination: ProfileView(user: user).environmentObject(favoriteManager), label: {
//                            FreelancerProfileOverviewTile(user: user)
//                        })
//                        
//                        // Display the item's name or the appropriate property
//                    }
//                }
//            }
//        }
    }
}

#Preview {
    SearchBar()
}
