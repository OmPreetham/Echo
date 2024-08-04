//
//  UserService.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/4/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task {
            try await fetchCurrentUser()
        }
    }
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        print("DEBUG: User \(user.username)")
    }
    
    func reset() {
        self.currentUser = nil
    }
}