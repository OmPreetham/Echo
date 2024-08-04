//
//  ProfileView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/4/24.
//

import SwiftUI

struct ProfileView: View {
    var user: User
        
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                Button {
                    // Add follow button action here
                } label: {
                    Label("Follow", systemImage: "person.fill.badge.plus")
                        .modifier(EchoButtonBlackModifier())
                }
                
                UserContentListView()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if let url = URL(string: "https://echo.com/users/\(user.username)") {
                    ShareLink(
                        item: url,
                        preview: SharePreview(user.username, image: Image("Shinji"))
                    )
                }
            }
        }
        .navigationTitle(user.username)
        .scrollIndicators(.hidden)
        .refreshable {
            // Add refreshable action here
        }
    }
}

#Preview {
    ProfileView(user: User(id: "", fullname: "", email: "", username: ""))
}
