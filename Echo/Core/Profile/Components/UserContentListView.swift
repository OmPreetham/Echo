//
//  UserContentListView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/4/24.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFiler: ProfilePostsFilter = .posts
    @Namespace var animation
    
    var body: some View {
        LazyVStack(pinnedViews: [.sectionHeaders], content: {
            Section {
                ForEach(0..<10, id: \.self) { post in
                    PostCell()
                        .frame(maxWidth: .infinity)
                }
            } header: {
                Picker("Select Filter", selection: $selectedFiler) {
                    ForEach(ProfilePostsFilter.allCases) { filter in
                        Text(filter.title)
                            .tag(filter)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(.background)
            }
        })
    }
}

#Preview {
    UserContentListView()
}
