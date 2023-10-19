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
    @StateObject var bottomSheetManager = BottomSheetManager()
    
    @ObservedObject private var networkMonitor = NetworkMonitor()
    var body: some View{
        ZStack{
            Group {
                if authVM.userSession != nil {
                    ProfileCheckView().environmentObject(authVM).environmentObject(profileVM)
                }else {
                    AuthView().environmentObject(authVM)
                }
            }
            .overlay(
                VStack {
                    if !networkMonitor.isNetworkAvailable {
                        HStack{
                            Text("Network not available")
                            .sheet(isPresented: $bottomSheetManager.showBottomSheet, content: {
                                VStack(content: {
                                    Text("No internet connection")
                                })
                            })
                        }.frame(height: 100).onAppear{
                            bottomSheetManager.toggleSheet()
                        }.presentationDetents([.height(100)])
                    }
                }
            )
        }

    }
}

//#Preview {
//    ContentView().environmentObject(AuthViewModel()).environmentObject(AuthViewModel())
//}
