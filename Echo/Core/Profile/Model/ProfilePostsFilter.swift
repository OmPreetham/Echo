//
//  ProfilePostsFilter.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import Foundation

enum ProfilePostsFilter: Int, CaseIterable, Identifiable {
    case posts, replies
    
    var title: String {
        switch self {
        case .posts: return "Posts"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { self.rawValue }
}

