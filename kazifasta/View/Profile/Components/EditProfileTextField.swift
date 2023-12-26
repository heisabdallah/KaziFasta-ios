//
//  EditProfileTextField.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 30/10/2023.
//

import SwiftUI

struct EditProfileTextField: View {
    var hintText: String
    @Binding var controller: String
    var body: some View {
        TextField(hintText, text: $controller).padding().overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(.gray),lineWidth: 1)).background(.white)
    }
}
//
//#Preview {
//    EditProfileTextField()
//}
