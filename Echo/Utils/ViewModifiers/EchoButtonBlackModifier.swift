//
//  EchoButtonBlackModifier.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct EchoButtonBlackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 320)
            .padding()
            .foregroundStyle(.background)
            .background(.foreground)
            .tint(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
