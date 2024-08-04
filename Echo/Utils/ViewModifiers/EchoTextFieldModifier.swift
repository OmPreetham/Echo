//
//  EchoTextFieldModifier.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/3/24.
//

import SwiftUI

struct EchoTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(.quaternary)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal, 24)
    }
}
