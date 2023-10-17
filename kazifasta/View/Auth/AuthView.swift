//
//  AuthView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 13/10/2023.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State var showSignInView: Bool = true
    
    func toggleViews(){
        showSignInView = !showSignInView
    }
    var body: some View {
        Group{
            if showSignInView{
                LoginView(onTap: toggleViews).environmentObject(authVM)
            }else{
                RegisterView(onTap: toggleViews).environmentObject(authVM)
            }
        }
    }
}

#Preview {
    AuthView()
}
