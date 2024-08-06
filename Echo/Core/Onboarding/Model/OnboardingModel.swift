//
//  OnboardingModel.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/5/24.
//

import Foundation

struct OnboardingInfo: Identifiable {
    var id = UUID()
    var label: String
    var content: String?
    var systemName: String
}
