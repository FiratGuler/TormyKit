//
//  File.swift
//  TormyKit
//
//  Created by Fırat Güler on 7.09.2025.
//

import Foundation

@MainActor
public final class ConfigureManager {
    public static let shared = ConfigureManager()
    
    private init() {}
    
    public func applyColors(_ theme: ThemeColorConfigure) {
        TormyColors.configure(theme: theme)
    }
    
    public func applyFont(themeFont: ThemeFontConfigure, themeFontSize: ThemeFontSizeConfigure) {
        TormyFonts.configure(themeFont: themeFont, themeFontSize: themeFontSize)
    }

}
