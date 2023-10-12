//
//  Header_AllCategoriesView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 10/10/2023.
//

import SwiftUI

struct Header_AllCategoriesView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack{
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.left")
            })
            Spacer()
            Text("All Categories").font(.headline.bold())
            Spacer()
            Image(systemName: "ellipsis")
        }.padding(.horizontal).padding(.bottom, 20)
    }
}

#Preview {
    Header_AllCategoriesView()
}
