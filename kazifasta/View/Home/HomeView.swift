//
//  HomeView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var profileVM: ProfileViewModel
    @StateObject var favoriteManager = FavoriteManager()
    
    var profile: Profile? {
        profileVM.profile.first
    }
    
    @State var refreshTimer: Timer?
    
    @State var showProfiles: Bool = false
    
    @State private var isFreelancer: Bool = false
    
    @State var skills = []

    let columns = [
        GridItem(.flexible(), spacing: 20, alignment: .leading),
    ]

//    Functions
    
    func loadData() {
            Task {
                 profileVM.fetchUser(authVM: authVM)
                 profileVM.fetchProfile()
                 profileVM.fetchProfiles()
            }
        }
    
    func startRefreshTimer() {
        refreshTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
                print("refreshing 🔥")
                profileVM.fetchProfiles()
                favoriteManager.fetchFavorites( userID: profile?.user_id ?? "")
            }
        }

    func stopRefreshTimer() {
        refreshTimer?.invalidate()
        refreshTimer = nil
    }
    
    func signOut(){
        Task {
            try? await authVM.signOut()
        }
    }
    
   
    var body: some View {
        VStack{
            Header_HomeView(profile: profile ?? Profile.init(id: "1", name: "Name")).padding([.horizontal, .top]).environmentObject(authVM).environmentObject(profileVM).environmentObject(favoriteManager)
            ZStack{
                ScrollView{
                    VStack(alignment: .leading){
                        HStack {
                            Text(isFreelancer ? "Let's find you a great job!" : "Let's find a Freelancer").font(.title2.bold())
                            Spacer()
                        }
                        SearchBar().environmentObject(favoriteManager)
                        
                    }.padding(.horizontal)
    //                Categories
                    HStack {
                        Text("Popular Categories").font(.subheadline.bold())
                        Spacer()
                        Image(systemName: "arrow.right")
                    }.padding([.top, .horizontal])
                    CategoryScrollView().environmentObject(favoriteManager)
                    
                    HStack {
                        Text("Freelancer on rise").font(.subheadline.bold())
                        Spacer()
                        Image(systemName: "arrow.right")
                    }.padding([.top, .horizontal])
                    
    //                ScrollView(.horizontal) {
    //                    LazyHStack(spacing: 15,content: {
    //                        ForEach(1...4, id: \.self) { count in
    //                            NavigationLink(destination: ProfileView(user: user).environmentObject(favoriteManager), label: {
    //                                if count == 1 {
    //                                    FreelancerProfileOverviewTile(user: user).environmentObject(favoriteManager).padding(.leading, 15)
    //                                }else if count == 4{
    //                                    FreelancerProfileOverviewTile(user: user).environmentObject(favoriteManager).padding(.trailing, 15)
    //                                }else{
    //                                    FreelancerProfileOverviewTile(user: user).environmentObject(favoriteManager)
    //                                }
    //                            })
    //
    //                        }
    //                    })
    //                }.scrollIndicators(.hidden)
                    HStack {
                        Text("Categories").font(.subheadline.bold())
                        Spacer()
                        Image(systemName: "arrow.right")
                    }.padding([.top, .horizontal])
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: columns, content: {
                            ForEach(Categories.prefix(5), id: \.id){category in
                                NavigationLink(destination: CategoryView(category: category).environmentObject(favoriteManager), label: {
                                    CategoryTile(category: category)
                                })
                            }
                        }).padding([.horizontal])
                    }.scrollIndicators(.hidden)
                    
                    NavigationLink(destination: AllCategoriesView().environmentObject(favoriteManager), label: {
                        Text("Browse All Categories").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).padding().background(Color.theme.buttonColor).clipShape(.capsule).padding(.horizontal).foregroundStyle(Color.theme.secondaryText)
                    })
                    
                    HStack {
                        Text("All Freelancers").font(.subheadline.bold())
                        Spacer()
                        Image(systemName: "arrow.down")
                    }.padding([.top, .horizontal])
                    VStack{
                        switch (profileVM.profiles.count < 2, showProfiles) {
                        case (true, _):
                            ActivityIndicator()
                                .frame(maxWidth: .infinity)
                                .background(Color.theme.primaryColor)
                        case (false, true):
                            LazyVGrid(columns: columns) {
                                ForEach(profileVM.profiles, id: \.id) { profile in
                                    NavigationLink(destination: ProfileView(profile: profile)
                                                    .environmentObject(profileVM)
                                                    .environmentObject(favoriteManager).environmentObject(authVM)) {
                                        FreelancerProfileOverviewTile(profile: profile)
                                            .environmentObject(favoriteManager)
                                    }
                                }
                            }
                            .padding([.horizontal])
                        default:
                            ActivityIndicator().frame(maxWidth: .infinity)
                                .background(Color.theme.primaryColor)
                        }
                    }.onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                showProfiles = true
                        }
                    }
                    
                        Spacer(minLength: 50)
                    
                    Button(action: {
                        signOut()
                    }, label: {
                        Text("Sign Out").font(.title3).foregroundStyle(Color.theme.primaryText)
                    })
                }.scrollIndicators(.hidden)
                if profileVM.profiles.contains(where: { $0.id == profile?.id }) {
                    ActivityIndicator().frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.theme.primaryColor)
                }
            }
            
        }.onAppear{
            Task {
                print("Loading data in Homeview 😁")
                loadData()
                print("data loaded in Homeview ✅")
                startRefreshTimer()
               }
            
        }.background(Color.theme.tertiaryText).foregroundStyle(Color.theme.secondaryText).navigationBarBackButtonHidden(true)
        
    }
    
}

#Preview {
    HomeView().environmentObject(AuthViewModel()).environmentObject(ProfileViewModel())
}


