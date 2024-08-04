//
//  UserCell.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack {
            CircularProfileImageView()
            
            VStack(alignment: .leading, spacing: 2) {
                Text(user.username)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.tertiary, lineWidth: 1)
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user: User(id: NSUUID().uuidString, fullname: "Shinji Ikari", email: "sikari@nge.com", username: "ShinjiIkari"))
}
