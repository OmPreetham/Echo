//
//  UserCardViewModel.swift
//  Echo
//
//  Created by Om Preetham Bandi on 8/5/24.
//

import Foundation
import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    private var motionManager = CMMotionManager()
    @Published var pitch: Double = 0.0
    @Published var roll: Double = 0.0

    init() {
        startMotionUpdates()
    }

    func startMotionUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.startDeviceMotionUpdates(to: .main) { [weak self] (motion, error) in
                if let motion = motion {
                    self?.pitch = motion.attitude.pitch
                    self?.roll = motion.attitude.roll
                }
            }
        }
    }

    deinit {
        motionManager.stopDeviceMotionUpdates()
    }
}

let colorSets: [ColorSet] = [
    ColorSet(
        stops: [
            .init(color: .userCard01, location: 0.0),
            .init(color: .userCard01, location: 0.2),
            .init(color: .userCard02, location: 0.2),
            .init(color: .userCard02, location: 0.4),
            .init(color: .userCard03, location: 0.4),
            .init(color: .userCard03, location: 0.6),
            .init(color: .userCard04, location: 0.6),
            .init(color: .userCard04, location: 0.8),
            .init(color: .userCard05, location: 0.8),
            .init(color: .userCard05, location: 1.0)
        ],
        backgroundColor: .userCard0BG
    ),
    ColorSet(
        stops: [
            .init(color: .userCard11, location: 0.0),
            .init(color: .userCard11, location: 0.2),
            .init(color: .userCard12, location: 0.2),
            .init(color: .userCard12, location: 0.4),
            .init(color: .userCard13, location: 0.4),
            .init(color: .userCard13, location: 0.6),
            .init(color: .userCard14, location: 0.6),
            .init(color: .userCard14, location: 0.8),
            .init(color: .userCard15, location: 0.8),
            .init(color: .userCard15, location: 1.0)
        ],
        backgroundColor: .userCard1BG
    ),
    ColorSet(
        stops: [
            .init(color: .userCard21, location: 0.0),
            .init(color: .userCard21, location: 0.2),
            .init(color: .userCard22, location: 0.2),
            .init(color: .userCard22, location: 0.4),
            .init(color: .userCard23, location: 0.4),
            .init(color: .userCard23, location: 0.6),
            .init(color: .userCard24, location: 0.6),
            .init(color: .userCard24, location: 0.8),
            .init(color: .userCard25, location: 0.8),
            .init(color: .userCard25, location: 1.0)
        ],
        backgroundColor: .userCard2BG
    ),

]
