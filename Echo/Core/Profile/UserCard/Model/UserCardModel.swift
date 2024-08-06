//
//  UserCardModel.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/5/24.
//

import Foundation
import SwiftUI

// Define a struct to hold color and location
struct ColorStop: Hashable {
    let color: Color
    let location: CGFloat
}

// Define a struct to represent a color set with a background color
struct ColorSet: Hashable {
    let stops: [ColorStop]
    let backgroundColor: Color
    
    // Function to create a Gradient from ColorSet
    func gradient() -> Gradient {
        Gradient(stops: stops.map { .init(color: $0.color, location: $0.location) })
    }
}
