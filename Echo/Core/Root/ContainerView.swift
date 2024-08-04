//
//  ContainerView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct ContainerView: View {
    @State private var showingSplashScreen: Bool = true
    
    var body: some View {
        if showingSplashScreen {
            SplashScreenView(isPresented: $showingSplashScreen)
        } else {
            ContentView()
        }
    }
}

#Preview {
    ContainerView()
}
