//
//  EchoTabView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct EchoTabView: View {
    @State private var selectedTab = 0
//    @State private var showingCreate = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
//            PendingView(systemName: "newspaper", viewName: "Creating Post")
//                .tabItem {
//                    Label("Create", systemImage: "plus")
//                }
//                .onAppear { selectedTab = 2 }
//                .tag(2)
            
            ActivityView()
                .tabItem {
                    Label("Activity", systemImage: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            CurrentUserProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
        }
//        .onChange(of: selectedTab, { oldValue, newValue in
//            showingCreate = selectedTab == 2
//        })
//        .sheet(isPresented: $showingCreate, onDismiss: {
//            selectedTab = 0
//        }) {
//            CreateView()
//                .presentationDetents([.medium, .large])
//        }
        .tint(.primary)
    }
}

#Preview {
    EchoTabView()
}
