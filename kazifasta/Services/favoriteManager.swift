//
//  favoriteManager.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 11/10/2023.
//

import Foundation

@MainActor
class FavoriteManager: ObservableObject {
    @Published private(set) var favorites: [Profile] = []
    
    func addToFavorites(authVM: AuthViewModel, profile: Profile){
        // If a product with the same ID already exists, delete it
        print("checking Favorites ❤️👀")
        let favoriteUser = favorites.first(where: { $0.id == profile.id })
        if favoriteUser != nil {
            print("removing from Favorites 🖤🔥")
            favorites = favorites.filter{$0.id != profile.id }
            Task{
                do{
                    let _ = try await authVM.supabase.database
                        .from("favorites")
                              .delete()
                              .eq(column: "id", value: profile.id)
                              .execute()
                }
                catch {
                    print("⚠️ An error removing from Favorites occurred: \(error)")
                }
                print("removed from Favorites 🖤✅")
            }
            
                } else{
                    // Otherwise, add the product to the cart
                    print("adding to Favorites ❤️🔥")
                    favorites.append(profile)
                    Task {
                        do {
                            
                            let _ = try await authVM.supabase.database
                                .from("favorites")
                                .insert(values: Profile(id: profile.id,name: profile.name, title: profile.title, profilePic: profile.profilePic, description: profile.description, user_id: authVM.userSession?.user.id.uuidString.lowercased()))
                                .execute().value

                        } catch {
                            print("⚠️ An error adding to Favorites occurred: \(error)")
                        }
                    }
                    print("added to Favorites ❤️✅")
                }
    }
    
    func fetchFavorites(authVM: AuthViewModel, userID: String) {
        print("fetching Favorites ❤️🪣🔥")
        Task {
            do {
                let jsonString: String = try await authVM.supabase.database
                    .from("favorites")
                    .select(columns: "*")
                    .eq(column: "user_id", value: userID)
                    .execute().value

                // Convert the JSON string to data
                if let jsonData = jsonString.data(using: .utf8) {
                    let decoder = JSONDecoder()
                    
                    do {
                        // Decode the JSON data into Profile Model
                        let decodedProfiles = try decoder.decode([Profile].self, from: jsonData)
                        
                        DispatchQueue.main.async {
                            self.favorites = decodedProfiles
                        }
                    } catch {
                        // Handle JSON parsing error
                        print("⚠️ Error parsing JSON: \(error)")
                    }
                }
                print("Favorites fetched ❤️🪣✅")
            } catch {
                print("⚠️ An error fetching favorited occurred: \(error)")
            }
        }
    }
}
