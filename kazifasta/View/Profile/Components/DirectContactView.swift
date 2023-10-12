//
//  DirectContactView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI

struct DirectContactView: View {
    var body: some View {
        HStack{
            Image(systemName: "phone.fill")
            Text("Call")
            Spacer()
            Image(systemName: "message.fill")
            Text("Direct Message")
        }.padding(.horizontal, 50).padding(.bottom, 50).padding(.top, 20)
    }
}

#Preview {
    DirectContactView()
}
