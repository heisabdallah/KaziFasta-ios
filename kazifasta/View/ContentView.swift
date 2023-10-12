//
//  ContentView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 05/10/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authVM = AuthViewModel()
        var body: some View{
            Group {
                if authVM.userSession != nil {
                    HomeView().environmentObject(authVM)
                }else {
                    LoginView().environmentObject(authVM)
                }
            }
        }
}

#Preview {
    ContentView().environmentObject(AuthViewModel())
}
