//
//  TormyFonts.swift
//  Wordy
//
//  Created by Fırat Güler on 7.09.2025.
//

import UIKit

// MARK: - Theme Configs

public struct ThemeFontConfigure {
    public var fontNames: [TormyFonts.FontType: String]
    
    public init(bold: String, semiBold: String, medium: String, regular: String) {
        self.fontNames = [
            .bold: bold,
            .semiBold: semiBold,
            .medium: medium,
            .regular: regular
        ]
    }
}

public struct ThemeFontSizeConfigure {
    public var fontSizes: [TormyFonts.FontSize: CGFloat]
    
    public init(h1: CGFloat, h2: CGFloat, h3: CGFloat, h4: CGFloat, h5: CGFloat,
                xLarge: CGFloat, large: CGFloat, medium: CGFloat, small: CGFloat, xSmall: CGFloat) {
        self.fontSizes = [
            .h1: h1, .h2: h2, .h3: h3, .h4: h4, .h5: h5,
            .xLarge: xLarge, .large: large, .medium: medium, .small: small, .xSmall: xSmall
        ]
    }
}

// MARK: - TormyFonts

@MainActor
public struct TormyFonts {
    
    public enum FontType { case bold, semiBold, medium, regular }
    public enum FontSize { case h1, h2, h3, h4, h5, xLarge, large, medium, small, xSmall }

    private static var themeFont: ThemeFontConfigure = ThemeFontConfigure(bold: "System-Bold",
                                                                          semiBold: "System-Semibold",
                                                                          medium: "System-Medium",
                                                                          regular: "System-Regular")
    
    private static var themeFontSize: ThemeFontSizeConfigure = ThemeFontSizeConfigure(
        h1: 34, h2: 28, h3: 24, h4: 20, h5: 18,
        xLarge: 32, large: 24, medium: 16, small: 14, xSmall: 12
    )
    
    // Cache dictionary
    private static var fontCache: [String: UIFont] = [:]
    
    private init() {}
    
    // MARK: - Configure
    
    public static func configure(themeFont: ThemeFontConfigure? = nil,
                                 themeFontSize: ThemeFontSizeConfigure? = nil) {
        if let font = themeFont { self.themeFont = font }
        if let size = themeFontSize { self.themeFontSize = size }
        fontCache.removeAll() // Reset cache
    }
    
    // MARK: - Font Access
    
    public static func font(type: FontType, size: FontSize) -> UIFont {
        let key = "\(type)-\(size)"
        if let cached = fontCache[key] { return cached }
        
        let fontName = themeFont.fontNames[type] ?? ""
        let fontSize = themeFontSize.fontSizes[size] ?? 14
        let uiFont = UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        
        fontCache[key] = uiFont
        return uiFont
    }
    
    
    // H1
    static var h1_bold: UIFont { font(type: .bold, size: .h1) }
    static var h1_semiBold: UIFont { font(type: .semiBold, size: .h1) }
    static var h1_medium: UIFont { font(type: .medium, size: .h1) }
    static var h1_regular: UIFont { font(type: .regular, size: .h1) }
    
    // H2
    static var h2_bold: UIFont { font(type: .bold, size: .h2) }
    static var h2_semiBold: UIFont { font(type: .semiBold, size: .h2) }
    static var h2_medium: UIFont { font(type: .medium, size: .h2) }
    static var h2_regular: UIFont { font(type: .regular, size: .h2) }
    
    // H3
    static var h3_bold: UIFont { font(type: .bold, size: .h3) }
    static var h3_semiBold: UIFont { font(type: .semiBold, size: .h3) }
    static var h3_medium: UIFont { font(type: .medium, size: .h3) }
    static var h3_regular: UIFont { font(type: .regular, size: .h3) }
    
    // H4
    static var h4_bold: UIFont { font(type: .bold, size: .h4) }
    static var h4_semiBold: UIFont { font(type: .semiBold, size: .h4) }
    static var h4_medium: UIFont { font(type: .medium, size: .h4) }
    static var h4_regular: UIFont { font(type: .regular, size: .h4) }
    
    // H5
    static var h5_bold: UIFont { font(type: .bold, size: .h5) }
    static var h5_semiBold: UIFont { font(type: .semiBold, size: .h5) }
    static var h5_medium: UIFont { font(type: .medium, size: .h5) }
    static var h5_regular: UIFont { font(type: .regular, size: .h5) }
    
    // Xlarge
    static var xLarge_bold: UIFont { font(type: .bold, size: .xLarge) }
    static var xLarge_semiBold: UIFont { font(type: .semiBold, size: .xLarge) }
    static var xLarge_medium: UIFont { font(type: .medium, size: .xLarge) }
    static var xLarge_regular: UIFont { font(type: .regular, size: .xLarge) }
    
    // Large
    static var large_bold: UIFont { font(type: .bold, size: .large) }
    static var large_semiBold: UIFont { font(type: .semiBold, size: .large) }
    static var large_medium: UIFont { font(type: .medium, size: .large) }
    static var large_regular: UIFont { font(type: .regular, size: .large) }
    
    // Medium
    static var medium_bold: UIFont { font(type: .bold, size: .medium) }
    static var medium_semiBold: UIFont { font(type: .semiBold, size: .medium) }
    static var medium_medium: UIFont { font(type: .medium, size: .medium) }
    static var medium_regular: UIFont { font(type: .regular, size: .medium) }
    
    // Small
    static var small_bold: UIFont { font(type: .bold, size: .small) }
    static var small_semiBold: UIFont { font(type: .semiBold, size: .small) }
    static var small_medium: UIFont { font(type: .medium, size: .small) }
    static var small_regular: UIFont { font(type: .regular, size: .small) }
    
    // XSmall
    static var xSmall_bold: UIFont { font(type: .bold, size: .xSmall) }
    static var xSmall_semiBold: UIFont { font(type: .semiBold, size: .xSmall) }
    static var xSmall_medium: UIFont { font(type: .medium, size: .xSmall) }
    static var xSmall_regular: UIFont { font(type: .regular, size: .xSmall) }

}
