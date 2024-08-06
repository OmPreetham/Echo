//
//  LoginView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            
            Spacer()
            
            Image(systemName: "rectangle.3.group.bubble.left.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
        
            VStack() {
                Group {
                    TextField("Enter your email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Enter your password", text: $viewModel.password)
                }
                .modifier(EchoTextFieldModifier())
            }
            
            NavigationLink {
                Text("Forgot Password")
            } label: {
                Text("Forgot Password?")
                    .font(.footnote)
                    .tint(.primary)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    .padding(.trailing, 28)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Button {
                Task {
                    try await viewModel.login()
                }
            } label: {
                Text("Login")
                    .modifier(EchoButtonBlackModifier())
            }
            
            Spacer()
            
            Divider()
                .background(.secondary)
            
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing: 3) {
                    Text("Don't have an account?")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .tint(.primary)
            }
            .padding(.vertical, 16)
        }
        .interactiveDismissDisabled()
    }
}

#Preview {
    LoginView()
}
