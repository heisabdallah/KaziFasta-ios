//
//  ContentView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 05/10/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var profileVM: ProfileViewModel

        var body: some View{
          
            Group {
                if authVM.userSession != nil { // await this process
                    HomeView().environmentObject(authVM).environmentObject(profileVM)
                }else {
                    AuthView().environmentObject(authVM)
                }
            }
        }
}

#Preview {
    ContentView().environmentObject(AuthViewModel()).environmentObject(AuthViewModel())
}
