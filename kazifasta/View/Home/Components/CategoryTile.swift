//
//  CategoryTile.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 16/10/2023.
//

import SwiftUI

struct CategoryTile: View {
    var category: Category
    var body: some View {
        VStack{
            Image(category.image ?? "").resizable().scaledToFill().frame(width: 90, height: 90).clipShape(Circle())
            Text(category.name).font(.footnote.bold())
        }.frame(width: 160, height: 160).overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.theme.buttonColor, lineWidth: 1)
        )
    }
}

#Preview {
    CategoryTile(category: Categories[0])
}
