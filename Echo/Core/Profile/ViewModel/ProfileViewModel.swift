//
//  ProfileViewModel.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/4/24.
//

import Combine
import Foundation

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: User in the viewModel \(String(describing: user))")
        }.store(in: &cancellables)
    }
}
