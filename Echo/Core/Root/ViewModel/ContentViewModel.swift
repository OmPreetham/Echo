//
//  ContentViewModel.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/4/24.
//

import Combine
import FirebaseAuth
import Foundation

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
