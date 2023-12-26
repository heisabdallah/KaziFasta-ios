//
//  AuthViewModel.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 12/10/2023.
//

import Foundation
import Supabase

@MainActor
class AuthViewModel: ObservableObject {
    
//    let supabase = SupabaseClient(supabaseURL: URL(string: "https://aqupnisjbaewvggogxxo.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxdXBuaXNqYmFld3ZnZ29neHhvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY2Nzc3NzAsImV4cCI6MjAxMjI1Mzc3MH0.PcEhNYlbUCAIiRZ2qqqjl_U_9cOoBGcw-XQgYY4njnQ")
    
    
    @Published var userSession: Session?

    init(){
        
        Task{
            print("fetching session in AuthVM 🔥")
            await fetchSession()
            print("session fetched in AuthVM  ✅")
        }
    }
    
    func fetchSession() async {
        print("fetching session in authVM ⭐️🔥")
        userSession = try? await supabase.auth.session
        print("session fetched in authVM ⭐️✅")
    }
         
     func signIn (email: String, password: String) async throws {
         do {
             
             try await supabase.auth.signIn(email: email.lowercased(), password: password)
             userSession = try await supabase.auth.session
             await fetchSession()
         }
         catch let error {
            throw error
        }
     }
        
        
    func SignUp (email: String, password: String) async throws {
        do{
            try await supabase.auth.signUp(email: email.lowercased(), password: password)
            userSession = try await supabase.auth.session
            await fetchSession()
            
        }catch let error{
            throw error
        }
    }
        
    func signOut() async throws{
        do{
            try await supabase.auth.signOut()
            userSession = nil
            ProfileViewModel.shared.profile = []
        }catch let error{
            throw error
        }
    }
    
    //    func authListener() async {
    //        for await _ in supabase.auth.authEventChange {
    ////            let event = event  types of Auth Events
    //            let session = try? await supabase.auth.session
    //            userSession = session
    //            print("listening.")
    //        }
    //    }
}
