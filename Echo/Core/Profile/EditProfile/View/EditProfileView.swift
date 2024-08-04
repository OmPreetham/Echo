//
//  EditProfileView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.tertiarySystemGroupedBackground)
                    .ignoresSafeArea()
                
                VStack {
                    // name profile image
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("Shinji")
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                    
                    Divider()
                        .background(.tertiary)

                    // Bio field
                    
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio...", text: $bio, axis: .vertical)
                    }
                    
                    Divider()
                        .background(.tertiary)

                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Add link...", text: $link)
                    }
                    
                    Divider()
                        .background(.tertiary)

                    Toggle("Private Profile", isOn: $isPrivateProfile)
                        .tint(.accentColor)
                }
                .font(.footnote)
                .padding()
                .background(.background)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        
                    }
                    .font(.subheadline)
                    .foregroundStyle(.foreground)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.foreground)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
