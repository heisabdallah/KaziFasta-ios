//
//  FreelancerProfileOverviewCell.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI

struct FreelancerProfileOverviewTile: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    @EnvironmentObject var authVM: AuthViewModel
    var profile: Profile
    @State var isLoading: Bool = false
    var body: some View {
        VStack{
//                        First Row
            HStack{
                Image(profile.avatarImage ?? "profile image ph").resizable().scaledToFill().frame(width: 50, height: 50).clipShape(Circle())
                VStack(alignment: .leading){
                    Text(profile.name).font(.subheadline.bold())
                    HStack {
                        Image(systemName: "star").foregroundStyle(.orange)
                        Text("4.5(84)")
                    }.font(.caption)
                }
                Spacer()
                Button(action: {
                    isLoading = true
                    favoriteManager.addToFavorites(authVM: authVM, profile: profile)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isLoading = false
                    }
                }, label: {
                    switch(isLoading){
                    case(true):
                        ActivityIndicator().background(Color.theme.buttonColor).clipShape(Circle())
                    default:
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .padding()
                            .foregroundStyle(.white)
                            .background(favoriteManager.favorites.contains(where: { $0.id == profile.id }) ? Color.red : Color.theme.buttonColor)
                            .clipShape(Circle())
                    }
                }).disabled(isLoading ? true : false)
                
            }.padding(.bottom)
//                        Second Row
            HStack{
                ProfileDetail(title: profile.title ?? "", headline: "Freelancer Type")
                Spacer()
                ProfileDetail(title: "2024", headline: "Joined")
                Spacer()
                ProfileDetail(title: "96", headline: "Total Clients")
            }.padding(.trailing, 30)
        }.padding(15).overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.theme.buttonColor, lineWidth: 1)
        )
    }
}

//#Preview {
//    FreelancerProfileOverviewTile()
//}

struct ProfileDetail: View {
    var title: String
    var headline: String
    var body: some View {
        VStack(alignment: .leading){
            Text(title).font(.subheadline.bold())
            Text(headline).font(.footnote).foregroundStyle(.gray)
        }
    }
}
