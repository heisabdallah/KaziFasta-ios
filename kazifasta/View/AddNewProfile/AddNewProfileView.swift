//
//  AddNewProfileView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 17/10/2023.
//

import SwiftUI

struct AddNewProfileView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var profileVM: ProfileViewModel
    
    
    func signOut(){
        Task {
            try? await authVM.signOut()
        }
    }
    
    var body: some View {
        VStack(spacing: 40){
            Text("Add New Profile")
            Text(profileVM.userID)
            
            Button(action: {
                signOut()
            }, label: {
                Text("Sign Out")
            })
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.theme.primaryColor).foregroundStyle(Color.theme.primaryText)
    }
    
}

#Preview {
    AddNewProfileView().environmentObject(AuthViewModel()).environmentObject(ProfileViewModel())
}
