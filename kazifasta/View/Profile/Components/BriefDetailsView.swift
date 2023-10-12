//
//  BriefDetailsView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI

struct BriefDetailsView: View {
    @EnvironmentObject var authVM: AuthViewModel
    var user: User
    
    var body: some View {
        VStack(spacing: 10){
            Image(user.profile?.profilePic ?? "profile image ph").resizable().scaledToFill().frame(width: 100, height: 100).clipShape(Circle()).padding(.top, 25)
            Text(user.profile?.name ?? "").font(.title3.bold())
            Text(user.profile?.title ?? "").font(.subheadline)
            HStack(spacing: 2) {
                Image(systemName: "mappin.and.ellipse").padding(.trailing, 8)
                Text(user.profile?.address?.city ?? "")
                Text(",")
                Text(user.profile?.address?.country ?? "")
//                Text(authVM.?? "")
            }.font(.subheadline.bold())
            Spacer()
        }.frame(maxWidth: .infinity).frame(maxHeight: .infinity).padding(.bottom, 40)
    }
}

#Preview {
    BriefDetailsView(user: Users[0])
}
