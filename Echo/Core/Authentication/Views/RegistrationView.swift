//
//  RegistrationView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = RegistrationViewModel()
    
    var body: some View {
        NavigationStack {
            
            Spacer()
            
            Image(systemName: "rectangle.3.group.bubble.left.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Group {
                    TextField("Enter your email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Enter your password", text: $viewModel.password)
                    
                    TextField("Enter your fullname", text: $viewModel.fullname)
                        .textInputAutocapitalization(.words)

                    TextField("Enter your username", text: $viewModel.username)
                }
                .modifier(EchoTextFieldModifier())
            }
            
            Button {
                Task {
                    try await viewModel.createUser()
                }
            } label: {
                Text("Sign Up")
                .modifier(EchoButtonBlackModifier())
            }
            .padding(.vertical)

            Spacer()
                        
            Divider()
                .background(.secondary)
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundStyle(.foreground)
            }
            .padding(.vertical, 16)
        }
        .interactiveDismissDisabled()
    }
}

#Preview {
    RegistrationView()
}
