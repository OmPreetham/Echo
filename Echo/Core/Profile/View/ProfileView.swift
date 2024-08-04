//
//  ProfileView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    private var currentUser: User? {
        viewModel.currentUser
    }
    
    @State private var selectedFiler: ProfilePostsFilter = .posts
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfilePostsFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        NavigationStack {
            if let currentUser {
                ScrollView {
                        VStack(spacing: 20) {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 12) {
                                    // bio, stats
                                    VStack(alignment: .leading, spacing: 4) {
                                        // fullname, username
                                        Text(currentUser.fullname)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                        
                                        Text(currentUser.username)
                                            .font(.subheadline)
                                    }
                                    
                                    if let bio = currentUser.bio {
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
                            
                            
                            Button {
                                
                            } label: {
                                Text("Follow")
                                    .modifier(EchoButtonBlackModifier())
                            }
                            
                            VStack {
                                HStack {
                                    ForEach(ProfilePostsFilter.allCases) { filter in
                                        VStack {
                                            Text(filter.title)
                                                .font(.subheadline)
                                                .fontWeight(selectedFiler == filter ? .semibold : .regular)
                                            if selectedFiler == filter {
                                                Rectangle()
                                                    .foregroundStyle(.primary)
                                                    .frame(width: filterBarWidth, height: 1)
                                                    .matchedGeometryEffect(id: "item", in: animation)
                                            } else {
                                                Rectangle()
                                                    .foregroundStyle(.clear)
                                                    .frame(width: filterBarWidth, height: 1)
                                            }
                                        }
                                        .onTapGesture {
                                            withAnimation(.spring) {
                                                selectedFiler = filter
                                            }
                                        }
                                    }
                                }
                                
                                LazyVStack {
                                    ForEach(0..<10, id: \.self) { post in
                                        PostCell()
                                    }
                                }
                            }
                            .padding(.vertical, 8)
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
                .scrollIndicators(.hidden)
            } else {
                VStack {
                    Image(systemName: "person.fill.viewfinder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                    
                    ProgressView("Loading Profile")
                }
                .frame(width: .infinity, height: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    ProfileView()
}
