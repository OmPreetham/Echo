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
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundStyle(.background)
            .background(.foreground)
            .tint(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal)
    }
}
