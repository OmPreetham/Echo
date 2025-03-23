//
//  CreateService.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/6/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

struct CreateService {
    static func uploadPost(_ post: Post) async throws {
        guard let postData = try? Firestore.Encoder().encode(post) else { return }
        try await Firestore.firestore().collection("posts").addDocument(data: postData)
    }
}
