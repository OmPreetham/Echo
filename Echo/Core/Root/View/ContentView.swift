//
//  ContentView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        if viewModel.userSession != nil {
            EchoTabView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
