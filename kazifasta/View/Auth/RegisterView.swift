//
//  RegisterView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 12/10/2023.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authVM: AuthViewModel
    
    @State var fullName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State private var isLoading = false
    @State private var navigateToHome = false
    @State private var showingAlert = false
    
    func register(){
        isLoading = true
        Task {
            await authVM.signup(email: email, password: password)
            isLoading = false
            navigateToHome = true
        }
    }
    

        var body: some View {
            ZStack {
                VStack(alignment: .center, spacing: 20){
                    AuthTitle(title: "Register")
                    InputView(text: $fullName, placeholder: "Full Name")
                    InputView(text: $email, placeholder: "Email").textInputAutocapitalization(.never)
                    InputView(text: $password, placeholder: "password", isSecure: true)
                    InputView(text: $confirmPassword, placeholder: "Confirm password", isSecure: true, isPasswordMatch: confirmPassword == password ? true : false)
                    
                    CTAButton(label: "Register", action: register, condition: isLoading || confirmPassword != password ).alert("Failed to Create Account", isPresented: $showingAlert) {
                                   Button("OK", role: .cancel) { }
                               }
                    NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                                        EmptyView()
                        }
                    HStack{
                        Text("Already have an Account?").foregroundStyle(.black)
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Sign In")
                        })
                    }
                }.frame(maxHeight: .infinity).background(.white)
                    .navigationBarBackButtonHidden(true)
                
                if isLoading {
                    ActivityIndicator().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(Color(white: 1, opacity: 0.4))
                } else {
                    // ... your other views ...
                }
            }
            
        }
}

#Preview {
    RegisterView().environmentObject(AuthViewModel())
}

