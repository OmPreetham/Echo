//
//  ExploreViewModel.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/4/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    private func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
