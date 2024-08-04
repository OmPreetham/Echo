//
//  ExploreView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<10, id: \.self) { user in
                        VStack {
                            UserCell()
                        }
                        .padding(.vertical, 4)
                        
                        Divider()
                            .background(.tertiary)
                    }
                    .padding(.leading)
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ExploreView()
}
