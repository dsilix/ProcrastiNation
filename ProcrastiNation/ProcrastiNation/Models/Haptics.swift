//
//  Haptics.swift
//  ProcrastiNation
//
//  Created by Silvio Saturno on 19/11/21.
//


import Foundation
import SwiftUI

struct Haptics {
    static func giveHaptic() {
        let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
           
    }
    
    static func giveSmallHaptic() {
        let impactMed = UIImpactFeedbackGenerator(style: .light)
            impactMed.impactOccurred()
           
    }
    
    static func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    

}
