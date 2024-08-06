//
//  ContentView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    @AppStorage("showingOnboarding") var showingOnboarding: Bool = true

    @State private var showingCreate: Bool = false
    @State private var showingLogin: Bool = false

    var body: some View {
        ZStack {
            if viewModel.userSession != nil {
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
        }
        .sheet(isPresented: $showingOnboarding) {
            OnboardingView(isOnboardingShowing: $showingOnboarding)
        }
        .sheet(isPresented: .constant(viewModel.userSession == nil)) {
            LoginView()
        }
        .sheet(isPresented: $showingCreate) {
            CreateView()
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    ContentView()
}
