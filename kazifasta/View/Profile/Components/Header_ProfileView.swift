//
//  HeaderView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI

struct Header_ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var bottomSheetManager = BottomSheetManager()
    var body: some View {
        HStack{
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.left")
            })
            Spacer()
            Text("Profile").font(.headline.bold())
            Spacer()
            Button(action: {bottomSheetManager.toggleSheet()}, label: {
                Image(systemName: "ellipsis")
            }).sheet(isPresented: $bottomSheetManager.showBottomSheet, content: {
                VStack(content: {
                    EditProfileView().environmentObject(bottomSheetManager)
                }).presentationDetents([.large])
            })
        }.padding(.horizontal).padding(.bottom, 20)
    }
}

#Preview {
    Header_ProfileView()
}
