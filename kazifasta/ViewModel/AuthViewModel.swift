//
//  AuthViewModel.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 12/10/2023.
//

import Foundation
import Supabase

class AuthViewModel: ObservableObject {
    
    let supabase = SupabaseClient(supabaseURL: URL(string: "https://aqupnisjbaewvggogxxo.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxdXBuaXNqYmFld3ZnZ29neHhvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY2Nzc3NzAsImV4cCI6MjAxMjI1Mzc3MH0.PcEhNYlbUCAIiRZ2qqqjl_U_9cOoBGcw-XQgYY4njnQ")
    
    
    @Published var userSession: Session?
    @Published var currentUser: User?
    
     func signIn (email: String, password: String) async throws {
         do {
             
             let session = try await supabase.auth.signIn(email: email, password: password)
             userSession = session
             let user = User(id: session.user.id.uuidString, email: email)
             currentUser = user

         }
         catch let error {
            throw error
        }
     }
        
        
    func SignUp(email:String, password:String) async throws{
        do{
            
            try await supabase.auth.signUp(email: email.lowercased(), password: password)
            try await signIn(email: email, password: password)
            
        }catch let error{
            throw error
        }
    }
        
    func signOut() async throws{
        do{
            try await supabase.auth.signOut()
            userSession = nil
            currentUser = nil
            
        }catch let error{
            throw error
        }
    }
}
