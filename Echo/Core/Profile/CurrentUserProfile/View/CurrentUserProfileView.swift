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
    
    @State private var showingEditProfileView: Bool = false
    @State private var showingUserCardView: Bool = false

    var body: some View {
        NavigationStack {
            if let currentUser {
                ScrollView {
                    VStack(spacing: 20) {
                        ProfileHeaderView(user: currentUser)
                        
                        HStack {
                            Group {
                                Button {
                                    showingEditProfileView.toggle()
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
                .sheet(isPresented: $showingEditProfileView, content: {
                    EditProfileView(user: currentUser)
                        .presentationDetents([.medium, .large])
                })
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
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button("Card", systemImage: "trophy.fill") {
                            showingUserCardView.toggle()
                        }
                    }
                }
                .refreshable {
                    
                }
                .sheet(isPresented: $showingUserCardView, content: {
                    UserCardView(user: currentUser)
                })
            } else {
                PendingView(systemName: "person.fill.viewfinder", viewName: "Fetching Profile")
            }
        }

    }
}

#Preview {
    CurrentUserProfileView()
}
