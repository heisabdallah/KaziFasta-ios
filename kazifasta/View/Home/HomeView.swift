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
    
    @StateObject var favoriteManager = FavoriteManager()
    @State private var isFreelancer: Bool = false
    
    var user = Users[0]
    let columns = [
        GridItem(.flexible(), spacing: 20, alignment: .leading),
//        GridItem(.flexible(), spacing: 20, alignment: .leading),
    ]
    let rows = [
        GridItem(.flexible(), spacing: 20, alignment: .leading),
//        GridItem(.flexible(), spacing: 20, alignment: .leading),
    ]
    
    var body: some View {
        VStack{
            Header_HomeView(user: user).padding([.horizontal, .top]).environmentObject(authVM).environmentObject(favoriteManager)
            
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
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 15,content: {
                        ForEach(1...4, id: \.self) { count in
                            NavigationLink(destination: ProfileView(user: user).environmentObject(favoriteManager), label: {
                                if count == 1 {
                                    FreelancerProfileOverviewTile(user: user).environmentObject(favoriteManager).padding(.leading, 15)
                                }else if count == 4{
                                    FreelancerProfileOverviewTile(user: user).environmentObject(favoriteManager).padding(.trailing, 15)
                                }else{
                                    FreelancerProfileOverviewTile(user: user).environmentObject(favoriteManager)
                                }
                            })
                            
                        }
                    })
                }.scrollIndicators(.hidden)
                HStack {
                    Text("Categories").font(.subheadline.bold())
                    Spacer()
                    Image(systemName: "arrow.right")
                }.padding([.top, .horizontal])
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, content: {
                        ForEach(Categories.prefix(5), id: \.id){category in
                            NavigationLink(destination: CategoryView(category: category).environmentObject(favoriteManager), label: {
                                CategoryTile(category: category)
                            })
                        }
                    }).padding([.horizontal])
                }.scrollIndicators(.hidden)
                
                NavigationLink(destination: AllCategoriesView().environmentObject(favoriteManager), label: {
                    Text("Browse All Categories").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).padding().background(Color.theme.buttonColor).clipShape(.capsule).padding(.horizontal).foregroundStyle(Color.theme.primaryText)
                })
                
                HStack {
                    Text("All Freelancers").font(.subheadline.bold())
                    Spacer()
                    Image(systemName: "arrow.down")
                }.padding([.top, .horizontal])
                LazyVGrid(columns: columns, content: {
                    ForEach(Users, id: \.id){user in
                        NavigationLink(destination: ProfileView(user: user).environmentObject(favoriteManager), label: {
                            FreelancerProfileOverviewTile(user: user).environmentObject(favoriteManager)
                        })
                    }
                }).padding([.horizontal])
            }.scrollIndicators(.hidden)
        }.background(Color.theme.primaryColor).foregroundStyle(Color.theme.primaryText).navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}

struct CategoryTile: View {
    var category: Category
    var body: some View {
        VStack{
            Image(category.image ?? "").resizable().scaledToFill().frame(width: 90, height: 90).clipShape(Circle())
            Text(category.name).font(.footnote.bold())
        }.frame(width: 160, height: 160).overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.theme.buttonColor, lineWidth: 1)
        )
    }
}
