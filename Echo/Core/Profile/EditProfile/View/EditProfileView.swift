//
//  EditProfileView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    let user: User
    
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 16) {
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: user, size: .extraLarge)
                    }
                }
                
                Text(user.fullname.capitalized)
                    .font(.title)
                    .fontDesign(.serif)
                    .fontWeight(.medium)
            }
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, alignment: .leading)

            List {
                Section(header: Text("Bio")) {
                    TextField("Enter your bio...", text: $bio, axis: .vertical)
                }
                
                Section(header: Text("Link")) {
                    TextField("Add link...", text: $link)
                }
                
                Section {
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: .init(id: "", fullname: "", email: "", username: ""))
}
