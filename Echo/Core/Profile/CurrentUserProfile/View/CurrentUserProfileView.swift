//
//  CurrentUserProfileView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/4/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    
    private var currentUser: User? {
        viewModel.currentUser
    }

    var body: some View {
        NavigationStack {
            if let currentUser {
                ScrollView {
                    VStack(spacing: 20) {
                        ProfileHeaderView(user: currentUser)
                        
                        HStack {
                            Group {
                                Button {
                                    
                                } label: {
                                    Label("Edit", systemImage: "square.and.pencil")
                                }
                                
                                if let url = URL(string: "https://echo.com/users/\(currentUser.username)") {
                                    ShareLink(
                                        item: url,
                                        preview: SharePreview(currentUser.username, image: Image("Shinji"))
                                    )
                                }
                            }
                            .modifier(EchoButtonBlackModifier())
                        }
                        
                        UserContentListView()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            Image(systemName: "power")
                                .tint(.primary)
                        }
                    }
                }
                .navigationTitle(currentUser.username)
                .scrollIndicators(.hidden)
                .refreshable {
                    
                }
            } else {
                PendingView(systemName: "person.fill.viewfinder", viewName: "Fetching Profile")
            }
        }

    }
}

#Preview {
    CurrentUserProfileView()
}
