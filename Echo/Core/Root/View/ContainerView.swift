//
//  ContainerView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct ContainerView: View {
    @State private var showingLaunchScreen: Bool = true
    
    var body: some View {
        ZStack {
            if showingLaunchScreen {
                LaunchScreenView(isPresented: $showingLaunchScreen)
            } else {
                ContentView()
            }
        }
    }
}

#Preview {
    ContainerView()
}
