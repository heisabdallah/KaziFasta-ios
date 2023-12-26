//
//  EditProfileView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 15/10/2023.
//

import SwiftUI
import PhotosUI
import CachedAsyncImage

struct EditProfileView: View {
    @EnvironmentObject var profileVM: ProfileViewModel
    @EnvironmentObject var authVM: AuthViewModel
    var profile: Profile
    @State var name: String = ""
    @State var title: String = ""
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    @EnvironmentObject var bottomSheetManager: BottomSheetManager
    
    
//    func insertProfileImage(){
//        
////        let file = avatarImage
//
//        try await authVM.supabase.storage.from(id: userID).upload(
//                        path: "avatars/avatar1.png",
////                        file: file,
//                        fileOptions: FileOptions(cacheControl: "3600")
//                    )
//        
//        Task{
//            do{
//                try await authVM.supabase.database
//                    .from("profile")
//                    .select(columns: "avatarImage")
//                    .eq(column: "user_id", value: userID)
//                    .execute().value
//            }
//        }
//    }
    
    
    var body: some View {
        
        HStack{
            Button(action: {bottomSheetManager.toggleSheet()}, label: {
                Image(systemName: "x.circle").foregroundStyle(Color.theme.primaryText)
            })
            Spacer()
            Image(systemName: "checkmark").foregroundStyle(Color.theme.primaryText)
        }.padding()
        VStack(spacing: 20) {
            Text("Edit Profile").font(.title2.bold()).foregroundStyle(Color.theme.primaryText)
            Spacer()
            ZStack{
                if let avatarImage {
                    avatarImage.resizable().scaledToFill().frame(width: 100, height: 100).clipShape(Circle())
                }else{
                    CachedAsyncImage(url: URL(string: profile.avatarImage ?? avatarPH)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
                PhotosPicker(selection: $avatarItem, matching: .images, label: {
                    
                    if avatarImage != nil{
                        avatarImage?.resizable().scaledToFill().frame(width: 100, height: 100).clipShape(Circle())
                        
                    }else{
                        CachedAsyncImage(url: URL(string: profile.avatarImage ?? avatarPH)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                })
            }
            
            EditProfileTextField(hintText: "Name", controller: $name)
            EditProfileTextField(hintText: "Title", controller: $title)

            CTAButton(label: "Save", action: {
//                $profileVM.insertProfileImage(authVM: authVM)
            }, condition: false)
            Spacer()
        }.padding(.horizontal).onChange(of: avatarItem){_ in
            Task{
                if let data = try? await avatarItem?.loadTransferable(type: Data.self){
                    if let uiImage = UIImage(data: data){
                        avatarImage = Image(uiImage: uiImage)
                        return
                    }
                }
                print("failed")
            }
        }
    }
}

#Preview {
    EditProfileView(profile: Profile(id: "1", name: "Abdallah Khalfan"))
}


