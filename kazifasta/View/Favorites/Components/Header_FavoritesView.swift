//
//  Header_FavoritesView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 12/10/2023.
//

import SwiftUI

struct Header_FavoritesView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack{
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.left")
            })
            Spacer()
            Text("Favorites").font(.headline.bold())
            Spacer()
            Image(systemName: "ellipsis")
        }.padding(.horizontal).padding(.bottom, 20)
    }
}

#Preview {
    Header_FavoritesView()
}
