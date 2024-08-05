//
//  ExploreView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ExploreViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                if !viewModel.users.isEmpty {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.users) { user in
                                NavigationLink(value: user) {
                                    VStack {
                                        UserCell(user: user)
                                    }
                                    .padding(.vertical, 4)
                                }
                                Divider()
                                    .background(.tertiary)
                            }
                            .padding(.leading)
                        }
                    }
                    .navigationDestination(for: User.self, destination: { user in
                        ProfileView(user: user)
                    })
                } else {
                    PendingView(systemName: "rectangle.stack.person.crop", viewName: "Fetching Users")
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
