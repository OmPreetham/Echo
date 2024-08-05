//
//  PendingView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/4/24.
//

import SwiftUI

struct PendingView: View {
    var systemName: String = "magnifyingglass"
    var viewName: String = "Searching"
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
            
            ProgressView(viewName.capitalized)
        }
    }
}

#Preview {
    PendingView()
}
