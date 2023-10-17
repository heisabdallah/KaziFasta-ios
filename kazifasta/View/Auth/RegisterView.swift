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
    
    var onTap: (() -> Void)?
    
    @State var fullName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State private var isLoading = false
    @State private var navigateToHome = false
    @State private var error: Error? // Store the error
    @State private var showAlert = false // Control whether the alert is shown

    
    func register() {
            isLoading = true

            Task {
                do {
                    try await authVM.SignUp(email: email, password: password)
                    await authVM.fetchSession()
                    isLoading = false
                    navigateToHome = true
                } catch {
                    isLoading = false
//                    error = error // Store the error
                    showAlert = true // Show the alert
                }
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
                    
                    CTAButton(label: "Register", action: register, condition: isLoading || confirmPassword != password ).alert("Failed to Create Account", isPresented: $showAlert) {
                                   Button("OK", role: .cancel) { }
                               }
                    NavigationLink(destination: HomeView().environmentObject(authVM), isActive: $navigateToHome) {
                                        EmptyView()
                        }
                    HStack{
                        Text("Already have an Account?").foregroundStyle(.black)
                        Button(action:
                                onTap ?? {
                            print("Tapped RegisterView")
                        } 
                        , label: {
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

