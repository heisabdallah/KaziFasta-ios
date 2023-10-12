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
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var isLoading = false
    @State private var navigateToHome = false
    @State private var showingAlert = true
    
    func signIn(){
        isLoading = true
        Task {
            await authVM.signIn(email: email, password: password)
            isLoading = false
            navigateToHome = true
        }
    }
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .center, spacing: 20){
                    AuthTitle(title: "Sign In")
                    InputView(text: $email, placeholder: "Email").textInputAutocapitalization(.never)
                    InputView(text: $password, placeholder: "password", isSecure: true)
                   
                    CTAButton(label: "Sign In", action: signIn, condition: isLoading).alert("Failed to Sign In", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }

                    NavigationLink(destination: HomeView().environmentObject(authVM), isActive: $navigateToHome) {
                        EmptyView()
                        }
                        HStack{
                            Text("Don't have an Account?").foregroundStyle(.black)
                            NavigationLink(destination: RegisterView().environmentObject(authVM), label: {
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
