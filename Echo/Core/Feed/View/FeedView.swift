//
//  FeedView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(0..<10, id: \.self) { post in
                        PostCell()
                    }
                }
            }
            .navigationTitle("Feed")
            .scrollIndicators(.hidden)
            .refreshable {
                print("DEBUG: Refresh Threads")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
