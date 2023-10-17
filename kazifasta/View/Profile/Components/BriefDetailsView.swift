//
//  BriefDetailsView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI

struct BriefDetailsView: View {
    @EnvironmentObject var profileVM: ProfileViewModel
    var profile: Profile
//    var profile: Profile? {
//        profileVM.profile.first
//    }
    var body: some View {
        VStack(spacing: 10){
            Image("profile image ph").resizable().scaledToFill().frame(width: 100, height: 100).clipShape(Circle()).padding(.top, 25)
            Text(profile.name).font(.title3.bold())
            Text(profile.title ?? "").font(.subheadline)
            HStack(spacing: 2) {
                Image(systemName: "mappin.and.ellipse").padding(.trailing, 8)
                Text("Dar es salaam")
                Text(",")
                Text("Tanzania")
//                Text(authVM.?? "")
            }.font(.subheadline.bold())
            Spacer()
        }.frame(maxWidth: .infinity).frame(maxHeight: .infinity).padding(.bottom, 40)
    }
}

//#Preview {
//    BriefDetailsView()
//}
