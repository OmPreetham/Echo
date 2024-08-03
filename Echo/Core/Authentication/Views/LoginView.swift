//
//  LoginView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            
            Spacer()
            
            Image("Echo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
        
            VStack {
                Group {
                    TextField("Enter your email", text: $email)
                    
                    SecureField("Enter your password", text: $password)
                }
                .modifier(EchoTextFieldModifier())
            }
            
            NavigationLink {
                Text("Forgot Password")
            } label: {
                Text("Forgot Password?")
                    .font(.footnote)
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    .padding(.trailing, 28)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Button {
                
            } label: {
                Text("Login")
                    .modifier(EchoButtonBlackModifier())
            }
            
            Spacer()
            
            Divider()
            
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
                .foregroundStyle(.black)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    LoginView()
}
