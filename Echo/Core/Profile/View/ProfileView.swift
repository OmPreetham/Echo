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
                    
                } label: {
                    Text("Follow")
                        .modifier(EchoButtonBlackModifier())
                }
                
                UserContentListView()
            }
        }
        .navigationTitle(user.username)
        .scrollIndicators(.hidden)
        .refreshable {
            
        }
    }
}

#Preview {
    ProfileView(user: User(id: "", fullname: "", email: "", username: ""))
}
