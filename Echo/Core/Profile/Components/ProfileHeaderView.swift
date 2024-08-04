//
//  ProfileHeaderView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/4/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    init(user: User? = nil) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                // name, bio, stats
                Text(user?.fullname ?? "")
                    .font(.title3)
                    .fontWeight(.medium)
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("0 Followers")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            CircularProfileImageView()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileHeaderView(user: User(id: "", fullname: "", email: "", username: ""))
}
