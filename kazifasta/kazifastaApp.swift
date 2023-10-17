//
//  kazifastaApp.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 05/10/2023.
//

import SwiftUI

@main
struct kazifastaApp: App {
    @StateObject var authVM = AuthViewModel()
    @StateObject var profileVM = ProfileViewModel()
    @State private var showSplash = true
    
    var body: some Scene {
            WindowGroup {
                if showSplash {
                    SplashView()
                        .onAppear {
                            Task{
                                do{
                                    await authVM.fetchSession()
                                    profileVM.fetchUser(authVM: authVM)
                                    profileVM.fetchProfile(authVM: authVM)
                                    profileVM.fetchProfiles(authVM: authVM)
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    showSplash = false
                                }
                            }
                        }
                } else {
                    NavigationStack {
                        ContentView().environmentObject(authVM).environmentObject(profileVM)
                    }
                }
            }
    }
}
