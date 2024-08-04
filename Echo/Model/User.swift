//
//  User.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/4/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    var id: String
    var fullname: String
    var email: String
    var username: String
    var profileImageURL: String?
    var bio: String?
}
