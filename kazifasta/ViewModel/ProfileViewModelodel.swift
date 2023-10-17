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
    
    func fetchUser(authVM: AuthViewModel) {
        Task{
            do{
                let fetchedUserID = await (authVM.userSession?.user.id.uuidString)!.lowercased()
                DispatchQueue.main.async {
                    self.userID = fetchedUserID
                }
            }
        }
    }
    
    func fetchProfile(authVM: AuthViewModel) {
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
            } catch {
                print("An error occurred: \(error)")
            }
        }
    }
    
    func fetchProfiles(authVM: AuthViewModel) {
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
            } catch {
                print("An error occurred: \(error)")
            }
        }
    }

}
