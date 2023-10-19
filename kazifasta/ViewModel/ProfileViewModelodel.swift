//
//  ProfileViewModel.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 16/10/2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    static let shared = ProfileViewModel()
    
    @Published var userID: String = ""
    @Published var profile: [Profile] = []
    @Published var profiles: [Profile] = []
        
    func fetchAll(authVM: AuthViewModel){
        Task{
            print("fetching all in ProfileVM ☝️🙋‍♂️🔥")
            fetchUser(authVM: authVM)
            fetchProfile(authVM: authVM)
            fetchProfiles(authVM: authVM)
            print("fetched all in ProfileVM ☝️🙋‍♂️🔥")
        }
    }
    
    func fetchUser(authVM: AuthViewModel) {
        print("fetching user ☝️🔥")
        Task{
            let fetchedUserID = await (authVM.userSession?.user.id.uuidString)?.lowercased()
            DispatchQueue.main.async {
                self.userID = fetchedUserID ?? ""
            }
            print("user fetched ☝️✅")
        }
    }
    
    func fetchProfile(authVM: AuthViewModel) {
        print("fetching profile ☝️🙋‍♂️🔥")
        Task {
            do {
                let jsonString: String = try await authVM.supabase.database
                    .from("profile")
                    .select(columns: "*")
                    .eq(column: "user_id", value: userID)
                    .execute().value

                // Convert the JSON string to data
                if let jsonData = jsonString.data(using: .utf8) {
                    let decoder = JSONDecoder()
                    
                    do {
                        // Decode the JSON data into Profile Model
                        let decodedProfile = try decoder.decode([Profile].self, from: jsonData)
                        
                        DispatchQueue.main.async {
                            self.profile = decodedProfile
                        }
                    } catch {
                        // Handle JSON parsing error
                        print("Error parsing JSON: \(error)")
                    }
                }
                print("profile fetched ☝️🙋‍♂️✅")
            } catch {
                print("An error occurred: \(error)")
            }
        }
    }
    
    func fetchProfiles(authVM: AuthViewModel) {
        print("fetching profiles 🙋‍♂️🔥")
        Task {
            do {
                let jsonString: String = try await authVM.supabase.database
                    .from("profile")
                    .select(columns: "*")
                    .neq(column: "user_id", value: userID)
                    .execute().value

                // Convert the JSON string to data
                if let jsonData = jsonString.data(using: .utf8) {
                    let decoder = JSONDecoder()
                    
                    do {
                        // Decode the JSON data into Profile Model
                        let decodedProfiles = try decoder.decode([Profile].self, from: jsonData)
                        
                        
                        DispatchQueue.main.async {
                            self.profiles = decodedProfiles
                        }
                    } catch {
                        // Handle JSON parsing error
                        print("Error parsing JSON: \(error)")
                    }
                }
            print("profiles fetched 🙋‍♂️✅")
            } catch {
                print("An error occurred: \(error)")
            }
        }
    }
}
