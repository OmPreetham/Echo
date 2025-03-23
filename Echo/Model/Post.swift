//
//  Thread.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/6/24.
//

import FirebaseCore
import FirebaseFirestore

struct Post: Identifiable, Codable {
    @DocumentID var postId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        postId ?? NSUUID().uuidString
    }
    
    var user: User?
}
