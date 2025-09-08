//
//  AppConstants.swift
//  Wordy
//
//  Created by Fırat Güler on 4.09.2025.
//

import UIKit

public struct LayoutConfigure {
    public var buttonHeight: CGFloat
    public var cornerRadius: CGFloat
    public var margin: CGFloat
    public var margin2x: CGFloat
    public var margin3x: CGFloat
    public var margin4x: CGFloat
    public var margin5x: CGFloat
    public var toastAlertHeight: CGFloat
    public var toastAlertTopPadding: CGFloat
    
    
    public init(
        buttonHeight: CGFloat = 44,
        cornerRadius: CGFloat = 8,
        margin: CGFloat = 8,
        margin2x: CGFloat = 16,
        margin3x: CGFloat = 24,
        margin4x: CGFloat = 32,
        margin5x: CGFloat = 40,
        toastAlertHeight: CGFloat = 60,
        toastAlertTopPadding: CGFloat = 16
    ) {
        self.buttonHeight = buttonHeight
        self.cornerRadius = cornerRadius
        self.margin = margin
        self.margin2x = margin2x
        self.margin3x = margin3x
        self.margin4x = margin4x
        self.margin5x = margin5x
        self.toastAlertHeight = toastAlertHeight
        self.toastAlertTopPadding = toastAlertTopPadding
    }
}

@MainActor
public struct TormyLayout {
    
    private static var theme: LayoutConfigure = LayoutConfigure()
    
    private init() {}
    
    static func configure(_ layout: LayoutConfigure) {
        self.theme = layout
    }
    
    // MARK: - Accessors
    public static var buttonHeight: CGFloat { theme.buttonHeight }
    public static var cornerRadius: CGFloat { theme.cornerRadius }
    public static var margin: CGFloat { theme.margin }
    public static var margin2x: CGFloat { theme.margin2x }
    public static var margin3x: CGFloat { theme.margin3x }
    public static var margin4x: CGFloat { theme.margin4x }
    public static var margin5x: CGFloat { theme.margin5x }
    
    public static var toastHeight: CGFloat { theme.toastAlertHeight }
    public static var toastTopPadding: CGFloat { theme.toastAlertTopPadding }
}


