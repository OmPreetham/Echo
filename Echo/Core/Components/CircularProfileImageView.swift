//
//  CircularProfileImageView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import Kingfisher
import SwiftUI

struct CircularProfileImageView: View {
    var user: User?
    var size: Size
    
    init(user: User?, size: Size = .medium) {
        self.user = user
        self.size = size
    }
    
    enum Size {
        case small
        case medium
        case large
        case extraLarge
        
        var dimensions: CGFloat {
            switch self {
            case .small:
                return 40
            case .medium:
                return 50
            case .large:
                return 60
            case .extraLarge:
                return 70
            }
        }
    }
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimensions, height: size.dimensions)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    VStack {
        CircularProfileImageView(user: .init(id: "", fullname: "", email: "", username: ""), size: .small)
        CircularProfileImageView(user: .init(id: "", fullname: "", email: "", username: ""), size: .medium)
        CircularProfileImageView(user: .init(id: "", fullname: "", email: "", username: ""), size: .large)
        CircularProfileImageView(user: .init(id: "", fullname: "", email: "", username: ""), size: .extraLarge)
    }
}
