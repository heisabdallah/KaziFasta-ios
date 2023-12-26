//
//  ProfileCheckView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 17/10/2023.
//

import SwiftUI

struct ProfileCheckView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var profileVM: ProfileViewModel
    
    @State var isLoading = true
    
    var body: some View {
            Group{
                switch (isLoading, profileVM.profile.count < 1) {
                    case (true, _):
                        ActivityIndicator()
                            .frame(maxWidth: .infinity)
                            .background(Color.theme.primaryColor)
                    case (false, true):
                        AddNewProfileView()
                            .environmentObject(authVM)
                            .environmentObject(profileVM)
                default:
                        HomeView()
                            .environmentObject(authVM)
                            .environmentObject(profileVM)
                    }
            }
        .onAppear{
            Task{
                profileVM.fetchProfile()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isLoading = false
                }
            }
        }.frame(maxHeight: .infinity).background(Color.theme.primaryColor)
    }
}

#Preview {
    ProfileCheckView().environmentObject(AuthViewModel()).environmentObject(ProfileViewModel())
}
