//
//  UserCardView.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/5/24.
//

import SwiftUI

struct UserCardView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var motionManager = MotionManager()
    
    @State private var hoverX: CGFloat = 0.0
    @State private var hoverY: CGFloat = 0.0

    var user: User?

    var body: some View {
        NavigationStack {
            TabView {
                ForEach(colorSets, id: \.self) { colorSet in
                    GeometryReader { geometry in
                        ZStack {
                            Color(colorSet.backgroundColor)
                            
                            ColorPalleteView(colorSet: colorSet, user: user)
                        }
                        .shadow(radius: 8)
                        .modifier(UserCardRotationEffectModifier(pitch: motionManager.pitch, roll: motionManager.roll, hoverX: hoverX, hoverY: hoverY))
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    let hoverPoint = value.location
                                    let centerX = geometry.size.width / 2
                                    let centerY = geometry.size.height / 2

                                    hoverX = (hoverPoint.x - centerX) / centerX
                                    hoverY = (hoverPoint.y - centerY) / centerY
                                }
                                .onEnded { _ in
                                    withAnimation(.easeOut(duration: 0.2)) {
                                        hoverX = 0.0
                                        hoverY = 0.0
                                    }
                                }
                        )
                        .animation(.easeInOut(duration: 0.1), value: hoverX)
                        .animation(.easeInOut(duration: 0.1), value: hoverY)
                    }
                    .frame(width: 300, height: 500)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .navigationTitle("Thank You")
            .navigationBarTitleDisplayMode(.inline)
            .shadow(radius: 8)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                }
            }
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .label
                UIPageControl.appearance().pageIndicatorTintColor = .secondaryLabel
            }
        }
    }
}


#Preview {
    UserCardView()
}
