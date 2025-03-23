//
//  CreateView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = CreateViewModel()
    
    @State private var caption = ""
    
    private var user: User? {
        UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: user, size: .medium)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.username ?? "No user")
                            .fontWeight(.semibold)
                        
                        TextField("Start writing", text: $caption, axis: .vertical)
                    }
                    .font(.subheadline)
                    
                    Spacer()
                    
                    if !caption .isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .tint(.secondary)
                                .frame(width: 12, height: 12)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        Task { try await viewModel.uploadPost(caption: caption) }
                        dismiss()
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                }
            }
        }
    }
}

#Preview {
    CreateView()
}
