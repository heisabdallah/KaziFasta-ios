//
//  ProfileView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 06/10/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authVM: AuthViewModel
    var user = Users[0]

    var body: some View {
        VStack(spacing: 0) {
            Header_ProfileView().padding(.top)
//            Text(authVM.currentUser ?? "")
            ScrollView {
                ZStack {
                    VStack {
                        BriefDetailsView(user: user)
                        Spacer()
                    }
                        VStack {
                            Spacer(minLength: 250)
                            FullDetailsView(user: user)
                        }
                }
            }.scrollIndicators(.hidden)
            DirectContactView()
                
        }.ignoresSafeArea(edges: .bottom).background(Color.theme.primaryColor).foregroundStyle(Color.theme.primaryText)
            .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileView()
}
