//
//  BriefDetailsView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI
import CachedAsyncImage

struct BriefDetailsView: View {
    @EnvironmentObject var profileVM: ProfileViewModel
    var profile: Profile

    var body: some View {
        VStack(spacing: 10){
            CachedAsyncImage(url: URL(string: profile.avatarImage ?? avatarPH)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                .background(Color.gray)
                .clipShape(Circle()).padding(.top, 30)
            Text(profile.name).font(.title3.bold())
            Text(profile.title ?? "").font(.subheadline)
            HStack(spacing: 2) {
                Image(systemName: "mappin.and.ellipse").padding(.trailing, 8)
                Text("Dar es salaam")
                Text(",")
                Text("Tanzania")
            }.font(.subheadline.bold())
            Spacer()
        }.frame(maxWidth: .infinity).frame(maxHeight: .infinity).padding(.bottom, 40)
    }
}

#Preview {
    BriefDetailsView(profile: Profile(id: "1", name: "Abdallah Khalfan", title: "Software Engineer", avatarImage: nil)).environmentObject(ProfileViewModel())
}
