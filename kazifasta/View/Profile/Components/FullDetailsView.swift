//
//  FullDetailsView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI

struct FullDetailsView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    @EnvironmentObject var profileVM: ProfileViewModel
//    @State var linelimit = 3
    @State var toggleReadMore: Bool = false
    var profile: Profile
//    var profile: Profile? {
//        profileVM.profile.first
//    }
    
    let columns = [
        GridItem(.flexible(), spacing: 20, alignment: .leading),
        GridItem(.flexible(), spacing: 20, alignment: .leading),
    ] 

    var body: some View {
        VStack {
            VStack{
                HStack {
                    Image(systemName: "person.fill")
                    Text("Member since")
                    Spacer()
                    Text("Feb, 2023")
                }
                HStack {
                    Image(systemName: "phone.fill")
                    Text("Calls received")
                    Spacer()
                    Text("105")
                }
                HStack {
                    Image(systemName: "star.fill")
                    Text("Popularity")
                    Spacer()
                    Text("2018")
                }
                
            }.padding().font(.subheadline).padding(.top, 20).foregroundStyle(Color.theme.tertiaryText)
            
            HStack {
                Text("Description").font(.subheadline.bold())
                Spacer()
            }
            HStack {
                Text(profile.description ?? "Loading...").font(.subheadline).foregroundStyle(Color.theme.tertiaryText).lineLimit(.max)
                Spacer()
            }
//            Read More Feature
//            HStack {
//                Text(!toggleReadMore ? "Read more.." : "Read less").font(.subheadline.bold()).foregroundStyle(.blue).onTapGesture {
//                    if linelimit == 3{
//                        linelimit = .max
//                        toggleReadMore = true
//                    }else{
//                        linelimit = 3
//                        toggleReadMore = false
//                    }
//                }
//                Spacer()
//            }
            
            VStack(alignment: .leading) {
                Text("Top Skills").font(.subheadline.bold())
//                LazyVGrid(columns: columns, spacing: 10, content: {
//                    ForEach(user.profile.skills, id: \.self){ skill in
//                        Text(skill).font(.caption).foregroundStyle(Color.theme.tertiaryText)
//                    }
//                })
            }.padding(.horizontal, 2).padding(.vertical)
            
            
            Spacer(minLength: 100)
            
        }.padding(.horizontal).frame(maxWidth: .infinity).background(Color.theme.secondaryColor).foregroundStyle(Color.theme.secondaryText).clipShape(.rect(topLeadingRadius: 20, topTrailingRadius: 20)).shadow(color: .init(red: 0, green: 0, blue: 0, opacity: 0.1),radius: 30, y: -40)
    }
}

//#Preview {
//    FullDetailsView().environmentObject(ProfileViewModel()).environmentObject(FavoriteManager())
//}
