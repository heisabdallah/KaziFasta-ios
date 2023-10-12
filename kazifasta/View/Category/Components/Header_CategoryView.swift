//
//  Header_CategoryView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 08/10/2023.
//

import SwiftUI

struct Header_CategoryView: View {
    var category: Category
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack{
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.left")
            })
            Spacer()
            Text(category.name).font(.headline.bold())
            Spacer()
            Image(systemName: "ellipsis")
        }.padding(.horizontal).padding(.bottom, 20)
    }
}


#Preview {
    Header_CategoryView(category: Categories[0])
}

