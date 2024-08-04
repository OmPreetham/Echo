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
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfilePostsFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }

    var body: some View {
        VStack {
            HStack {
                ForEach(ProfilePostsFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFiler == filter ? .semibold : .regular)
                        if selectedFiler == filter {
                            Rectangle()
                                .foregroundStyle(.primary)
                                .frame(width: filterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: filterBarWidth, height: 1)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring) {
                            selectedFiler = filter
                        }
                    }
                }
            }
            
            LazyVStack {
                ForEach(0..<10, id: \.self) { post in
                    PostCell()
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    UserContentListView()
}
