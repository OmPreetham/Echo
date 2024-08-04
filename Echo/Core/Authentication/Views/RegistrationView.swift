//
//  RegistrationView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    
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
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Enter your password", text: $password)
                    
                    TextField("Enter your fullname", text: $fullname)

                    TextField("Enter your username", text: $username)
                }
                .modifier(EchoTextFieldModifier())
            }
            
            Button {
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
    }
}

#Preview {
    RegistrationView()
}
