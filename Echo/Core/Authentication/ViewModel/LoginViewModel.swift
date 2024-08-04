//
//  LoginViewModel.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/4/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
