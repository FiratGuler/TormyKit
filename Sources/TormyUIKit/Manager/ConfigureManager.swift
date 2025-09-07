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
    
    public func applyColors(_ theme: ColorConfigure) {
        TormyColors.configure(theme: theme)
    }
    
    public func applyFont(themeFont: FontConfigure, themeFontSize: FontSizeConfigure) {
        TormyFonts.configure(themeFont: themeFont, themeFontSize: themeFontSize)
    }
    
    public func applyLayout(_ layout: LayoutConfigure) {
        TormyLayout.configure(layout)
    }

}
