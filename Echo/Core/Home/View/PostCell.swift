//
//  PostCell.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 4) {
                CircularProfileImageView(user: nil, size: .small)

                VStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(alignment: .center) {
                            Text("Shinji")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            Text("120 Upvotes")
                                .font(.caption2)
                            
                            Spacer()
                            
                            Text("10m")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "ellipsis")
                                    .foregroundStyle(.foreground)
                            }
                        }
                        
                        Text("Echo is your platform for open discussions with fellow university students. Share your thoughts, ask questions, and connect with others in a safe and welcoming environment.")
                            .font(.subheadline)
                            .lineLimit(9)
                            .multilineTextAlignment(.leading)
                        
                        HStack(spacing: 16) {
                            Button {
                                
                            } label: {
                                Image(systemName: "heart")
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "bubble.right")
                            }

                            Button {
                                
                            } label: {
                                Image(systemName: "bookmark")
                            }
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                ShareLink("", item: "")
                            }
                        }
                    }
                    .foregroundStyle(.primary)
                    .padding(.horizontal, 8)
                    
                    Divider()
                        .background(.tertiary)
                }
            }
            .padding(.vertical, 4)
        }
        .padding(.leading)
    }
}

#Preview {
    PostCell()
}
