//
//  TormyHapticFeedbackManager.swift
//  TormyKit
//
//  Created by Fırat Güler on 4.11.2025.
//


import UIKit



@MainActor
public final class TormyHapticFeedbackManager {
    public static let shared = TormyHapticFeedbackManager()
    
    public enum HapticType {
        case success, warning, error
        case light, medium, heavy
    }
        
    public var isEnabled: Bool = true
    
    private let notificationGenerator = UINotificationFeedbackGenerator()
    private let lightImpactGenerator = UIImpactFeedbackGenerator(style: .light)
    private let mediumImpactGenerator = UIImpactFeedbackGenerator(style: .medium)
    private let heavyImpactGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    private init() {
        notificationGenerator.prepare()
        lightImpactGenerator.prepare()
        mediumImpactGenerator.prepare()
        heavyImpactGenerator.prepare()
    }
    
    public func trigger(_ type: HapticType) {
        guard isEnabled else { return }
        
        switch type {
        case .success: notificationGenerator.notificationOccurred(.success)
        case .warning: notificationGenerator.notificationOccurred(.warning)
        case .error: notificationGenerator.notificationOccurred(.error)
        case .light: lightImpactGenerator.impactOccurred()
        case .medium: mediumImpactGenerator.impactOccurred()
        case .heavy: heavyImpactGenerator.impactOccurred()
        }
    }

}
