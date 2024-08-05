//
//  ContentView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    @State private var selectedTab = 0
    @State private var showingCreate = false

    var body: some View {
        if viewModel.userSession != nil {
            ZStack {
                EchoTabView()
                
                Button {
                    showingCreate = true
                } label: {
                    Label("New Post", systemImage: "plus")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .padding()
                .foregroundStyle(.background)
                .background(.foreground)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(.bottom, 70)
                .padding(.trailing, 20)
            }
            .sheet(isPresented: $showingCreate) {
                CreateView()
                    .presentationDetents([.medium, .large])
            }
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
