//
//  EditProfileView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 15/10/2023.
//

import SwiftUI

struct EditProfileView: View {
    @State var name: String = ""
    @State var title: String = ""
    @EnvironmentObject var bottomSheetManager: BottomSheetManager
    var body: some View {
        HStack{
            Button(action: {bottomSheetManager.toggleSheet()}, label: {
                Image(systemName: "x.circle").foregroundStyle(Color.theme.secondaryText)
            })
            Spacer()
            Image(systemName: "checkmark").foregroundStyle(Color.theme.secondaryText)
        }.padding()
        VStack(spacing: 20) {
            Text("Edit Profile").font(.title2.bold()).foregroundStyle(Color.theme.secondaryText)
            Spacer()
            Image("image ph").resizable().scaledToFill().frame(width: 100, height: 100).clipShape(Circle())
            TextField("Name", text: $name).padding().border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            TextField("Title", text: $title).padding().border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            CTAButton(label: "Save", action: {}, condition: false)
            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    EditProfileView()
}
