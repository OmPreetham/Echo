//
//  ColorPalleteView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/5/24.
//

import SwiftUI

struct ColorPalleteView: View {
    var colorSet: ColorSet
    var user: User?
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text(user?.username.uppercased() ?? "No username".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .fontDesign(.serif)
                    .foregroundColor(.white)
                    .padding(4)
                    .background(Color.black)
                    .padding(.bottom)
                
                Text("Thank you for being a valuable member".capitalized)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                HStack {
                    Text(user?.id.uppercased() ?? "UNKNOWN".uppercased())
                        .font(.caption)
                        .padding(2)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Image(systemName: "sparkles")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                }
            }
            .frame(height: 250)
            .padding(20)
            
            Spacer()
            
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: colorSet.gradient(),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(height: 250)
        }
    }
}

#Preview {
    ColorPalleteView(colorSet: .init(stops: [
        .init(color: Color(red: 0.9, green: 0.61, blue: 0.22), location: 0.0),
        .init(color: Color(red: 0.9, green: 0.61, blue: 0.22), location: 0.2),
        .init(color: Color(red: 0.86, green: 0.32, blue: 0.17), location: 0.2),
        .init(color: Color(red: 0.86, green: 0.32, blue: 0.17), location: 0.4),
        .init(color: Color(red: 0.84, green: 0.19, blue: 0.18), location: 0.4),
        .init(color: Color(red: 0.84, green: 0.19, blue: 0.18), location: 0.6),
        .init(color: Color(red: 0.61, green: 0.11, blue: 0.2), location: 0.6),
        .init(color: Color(red: 0.61, green: 0.11, blue: 0.2), location: 0.8),
        .init(color: Color(red: 0.33, green: 0.11, blue: 0.27), location: 0.8),
        .init(color: Color(red: 0.33, green: 0.11, blue: 0.27), location: 1.0)
    ], backgroundColor: .blue))
    .padding()
}
