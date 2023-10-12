//
//  InputView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 12/10/2023.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool = false
    @State var showPassword: Bool = false
    @FocusState var show: Bool
    @FocusState var hide: Bool
    var isPasswordMatch: Bool = true
    var isPasswordLength: Bool = true
    var body: some View {
            if isSecure {
                HStack {
                    ZStack {
                        TextField(placeholder, text: $text).autocorrectionDisabled(true).textInputAutocapitalization(.never).opacity(showPassword ? 1 : 0)
                        SecureField(placeholder, text: $text).autocorrectionDisabled(true).textInputAutocapitalization(.never).opacity(showPassword ? 0 : 1)
                        HStack(content: {
                            if !isPasswordMatch {
                                Image(systemName: "mappin.circle")
                            }
                            Button(action: {
                                showPassword.toggle()
                                if !showPassword {
                                    show = true
                                }else {
                                    hide = true
                                }
                            }, label: {
                                Image(systemName: showPassword ? "eye" : "eye.slash")
                            })
                        }).padding(.leading, 300)
                       
                    }
                }.padding().frame(maxWidth: .infinity, maxHeight: 50).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.white),lineWidth: 2)).shadow(radius: 1).background(.white).padding(.horizontal)
            }else {
                HStack {
                    TextField(placeholder, text: $text).autocorrectionDisabled(true)
                }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.white),lineWidth: 2)).shadow(radius: 1).background(.white).padding(.horizontal)
            }
    }
}

#Preview {
    InputView(text: .constant(""), placeholder: "password", isSecure: true)
}

