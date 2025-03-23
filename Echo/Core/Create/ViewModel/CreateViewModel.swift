//
//  CreateViewModel.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/6/24.
//

import Foundation
import FirebaseAuth
import FirebaseCore

class CreateViewModel: ObservableObject {
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let post = Post(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await CreateService.uploadPost(post)
    }
}
