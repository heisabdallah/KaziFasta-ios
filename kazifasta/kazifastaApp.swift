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
                                    print("fetching session in ROOT 👀 🔥")
                                    await authVM.fetchSession()
                                    print("session in ROOT fetched 👀 ✅")
                                    print("fetching profiles in ROOT 🙋‍♂️🔥")
                                    profileVM.fetchAll(authVM: authVM)
                                    print("profiles fetched in ROOT 🙋‍♂️✅")
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            showSplash = false
                                    }
                                }
                            }
                        }
                } else {
                    NavigationStack {
                        if profileVM.profiles.count > 2 {
                            ContentView().environmentObject(authVM).environmentObject(profileVM)
                        }
                    }
                }
            }
    }
}
