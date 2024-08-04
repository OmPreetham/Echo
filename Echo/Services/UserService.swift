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
        print("DEBUG: Fetched \(user.username)")
    }
    
    static func fetchAllUsers() async throws -> [User] {
        guard let currentUID = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self)})
        return users.filter({ $0.id != currentUID})
    }
    
    func reset() {
        self.currentUser = nil
    }
}
