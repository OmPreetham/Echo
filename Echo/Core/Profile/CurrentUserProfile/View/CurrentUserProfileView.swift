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
                                    Text("Edit")
                                }
                                
                                Button {
                                    
                                } label: {
                                    Text("Share")
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
                VStack(alignment: .center) {
                    Image(systemName: "person.fill.viewfinder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                    
                    ProgressView("Loading Profile")
                }
            }
        }

    }
}

#Preview {
    CurrentUserProfileView()
}
