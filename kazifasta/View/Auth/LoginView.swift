//
//  LoginView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 12/10/2023.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var profileVM: ProfileViewModel
    
    var onTap: (() -> Void)?

    
    @State var email: String = ""
    @State var password: String = ""
    @State private var isLoading = false
    @State private var navigateToHome = false
    @State private var error: Error? // Store the error
    @State private var showAlert = false // Control whether the alert is shown

    
    func signIn(){
        isLoading = true
        
        Task {
            do {
                try await authVM.signIn(email: email, password: password)
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
                    AuthTitle(title: "Sign In")
                    InputView(text: $email, placeholder: "Email").textInputAutocapitalization(.never)
                    InputView(text: $password, placeholder: "password", isSecure: true)
                   
                    CTAButton(label: "Sign In", action: signIn, condition: isLoading).alert("Failed to Sign In", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }

                NavigationLink(destination: HomeView().environmentObject(authVM).environmentObject(profileVM), isActive: $navigateToHome) {
                        EmptyView()
                        }
                        HStack{
                            Text("Don't have an Account?").foregroundStyle(.black)
                            Button(action:
                                    onTap ?? {
                                print("Tapped RegisterView")
                            }
                            , label: {
                                Text("Register").foregroundStyle(.blue)
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
    LoginView().environmentObject(AuthViewModel())
}
