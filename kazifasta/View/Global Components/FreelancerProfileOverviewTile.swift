//
//  FreelancerProfileOverviewCell.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI

struct FreelancerProfileOverviewTile: View {
    var user: User
    @EnvironmentObject var favoriteManager: FavoriteManager
    var body: some View {
        VStack{
//                        First Row
            HStack{
                Image(user.profile.profilePic ?? "profile image ph").resizable().scaledToFill().frame(width: 50, height: 50).clipShape(Circle())
                VStack(alignment: .leading){
                    Text(user.profile.name).font(.subheadline.bold())
                    HStack {
                        Image(systemName: "star").foregroundStyle(.orange)
                        Text("4.5(84)")
                    }.font(.caption)
                }
                Spacer()
                Button(action: {
                    favoriteManager.addToFavorites(user: user)
                }, label: {
                    Image(systemName: "heart").resizable().scaledToFit().frame(width: 15, height: 15).padding().foregroundStyle(.white).background(favoriteManager.favorites.contains(where: { $0.id == user.id }) ? Color.red : Color.theme.buttonColor).clipShape(Circle())
                })
                
            }.padding(.bottom)
//                        Second Row
            HStack{
                ProfileDetail(title: user.profile.category, headline: "Freelancer Type")
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

#Preview {
    FreelancerProfileOverviewTile(user: Users[0])
}

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