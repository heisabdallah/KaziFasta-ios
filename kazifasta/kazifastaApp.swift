//
//  kazifastaApp.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 05/10/2023.
//

import SwiftUI

@main
struct kazifastaApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView().environmentObject(authVM)
            }
        }
    }
}
