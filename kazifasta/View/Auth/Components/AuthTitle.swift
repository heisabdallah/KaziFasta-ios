//
//  AuthTitle.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 12/10/2023.
//

import SwiftUI

struct AuthTitle: View {
    var title: String
    var body: some View {
        Image(systemName: "person").resizable().scaledToFit().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        Text(title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundStyle(.black)
    }
}

#Preview {
    AuthTitle(title: "Register")
}

