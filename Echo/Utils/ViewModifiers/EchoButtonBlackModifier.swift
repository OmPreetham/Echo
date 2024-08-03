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
            .frame(width: 320)
            .padding()
            .background(.black)
            .font(.subheadline)
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
