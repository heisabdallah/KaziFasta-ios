//
//  AllCategoriesView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 09/10/2023.
//

import SwiftUI

struct AllCategoriesView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    let columns = [
        GridItem(.flexible(), spacing: 20, alignment: .leading),
        GridItem(.flexible(), spacing: 20, alignment: .leading),
    ]
    var body: some View {
        VStack{
            Header_AllCategoriesView().padding(.vertical)
            ScrollView() {
                LazyVGrid(columns: columns, content: {
                    ForEach(Categories, id: \.id){category in
                        NavigationLink(destination: CategoryView(category: category).environmentObject(favoriteManager), label: {
                            CategoryTile(category: category)
                        })
                    }
                }).padding([.horizontal])
            }.scrollIndicators(.hidden)
        }.background(Color.theme.primaryColor).foregroundStyle(Color.theme.primaryText).navigationBarBackButtonHidden()
    }
}

#Preview {
    AllCategoriesView()
}
