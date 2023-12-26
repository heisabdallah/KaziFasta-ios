//
//  ProfileView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 06/10/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var profileVM: ProfileViewModel
    var profile: Profile
    
    var body: some View {
        VStack(spacing: 0) {
            Header_ProfileView(profile: profile).padding(.top).environmentObject(authVM).environmentObject(profileVM)
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
                
//                if profileVM.profile.isEmpty {
//                    ActivityIndicator().frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.theme.primaryColor)
//                }
            }
            
                
        }.ignoresSafeArea(edges: .bottom).background(Color.theme.tertiaryText).foregroundStyle(Color.theme.secondaryText)
    .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileView(profile: Profile(id: "1", name: "Abdallah Khalfan", title: "Software Engineer")).environmentObject(ProfileViewModel()).environmentObject(AuthViewModel())
}
