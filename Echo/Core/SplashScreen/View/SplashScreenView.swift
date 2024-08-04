//
//  SplashScreenView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isPresented: Bool
    
    @State private var screenOpacity: Double = 1.0
    @State private var scale: CGSize = CGSize(width: 0.8, height: 0.8)
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            
            ZStack {
                Image(systemName: "rectangle.3.offgrid.bubble.left.fill")
                    .font(.system(size: 108))
                    .foregroundStyle(.foreground)
            }
            .scaleEffect(scale)
        }
        .opacity(screenOpacity)
        .onAppear {
            withAnimation(.spring(duration: 0.5)) {
                scale = CGSize(width: 1.2, height: 1.2)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                withAnimation(.spring(duration: 1)) {
                    scale = CGSize(width: 1, height: 1)
                }
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4, execute: {
                withAnimation(.spring(duration: 0.35)) {
                    scale = CGSize(width: 50, height: 50)
                    screenOpacity = 0
                }
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.6, execute: {
                withAnimation(.easeIn(duration: 0.2)) {
                    isPresented.toggle()
                }
            })
        }
    }
}

#Preview {
    SplashScreenView(isPresented: .constant(true))
}
