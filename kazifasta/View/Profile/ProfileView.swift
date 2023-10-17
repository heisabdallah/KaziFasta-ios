//
//  ProfileView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 06/10/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var profileVM: ProfileViewModel
    @EnvironmentObject var authVM: AuthViewModel
    var profile: Profile
    
    var body: some View {
        VStack(spacing: 0) {
            Header_ProfileView().padding(.top)
            ZStack{
                VStack{
                    ScrollView {
                        ZStack {
                            VStack {
                                BriefDetailsView(profile: profile).environmentObject(profileVM)
                                Spacer()
                            }
                                VStack {
                                    Spacer(minLength: 250)
                                    FullDetailsView(profile: profile).environmentObject(profileVM)
                                }
                        }
                    }.scrollIndicators(.hidden)
                    DirectContactView()
                }
                
                if profileVM.profile.isEmpty {
                    ActivityIndicator().frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.theme.primaryColor)
                }
            }
            
                
        }.onAppear{
//            Task {
//                profileVM.fetchUser(authVM: authVM)
//                profileVM.fetchProfile(authVM: authVM)
//               }
            
        }.ignoresSafeArea(edges: .bottom).background(Color.theme.primaryColor).foregroundStyle(Color.theme.primaryText)
    .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    ProfileView().environmentObject(AuthViewModel())
//}
