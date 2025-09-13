//
//  TormyFonts.swift
//  Wordy
//
//  Created by Fırat Güler on 7.09.2025.
//

import UIKit

// MARK: - Theme Configs

public struct FontConfigure {
    public var fontNames: [TormyFonts.FontType: String]
    
    public init(black: String ,extraBold: String ,bold: String, semiBold: String, medium: String, regular: String) {
        self.fontNames = [
            .black: black,
            .extraBold: extraBold,
            .bold: bold,
            .semiBold: semiBold,
            .medium: medium,
            .regular: regular
        ]
    }
}

public struct FontSizeConfigure {
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
    let font: UIFont
    public enum FontType { case black, extraBold, bold, semiBold, medium, regular }
    public enum FontSize { case h1, h2, h3, h4, h5, xLarge, large, medium, small, xSmall }

    private static var themeFont: FontConfigure = FontConfigure(black: "HelveticaNeue-Black",
                                                                extraBold: "HelveticaNeue-ExtraBold",
                                                                bold: "HelveticaNeue-Bold",
                                                                semiBold: "HelveticaNeue-Medium",
                                                                medium: "HelveticaNeue",
                                                                regular: "HelveticaNeue-Light")
    
    private static var themeFontSize: FontSizeConfigure = FontSizeConfigure(
        h1: 34, h2: 28, h3: 24, h4: 20, h5: 18,
        xLarge: 32, large: 24, medium: 16, small: 14, xSmall: 12
    )
    
    private static var fontCache: [String: UIFont] = [:]
    
    private init() {}
    
    // MARK: - Configure
    
    static func configure(themeFont: FontConfigure? = nil,
                                 themeFontSize: FontSizeConfigure? = nil) {
        if let font = themeFont { self.themeFont = font }
        if let size = themeFontSize { self.themeFontSize = size }
        fontCache.removeAll()
        validateFonts()
    }
    
    // MARK: - Validate
    private static func validateFonts() {
        var missingFonts: [String] = []
        
        for (type, fontName) in themeFont.fontNames {
            if UIFont(name: fontName, size: 12) == nil {
                missingFonts.append("'\(fontName)' (\(type))")
            }
        }
        
        if missingFonts.isEmpty {
            TormyUIKitCore.log("Tüm fontlar başarıyla tanımlandı", type: .success)

        } else {
            for missing in missingFonts {
                TormyUIKitCore.log("Tanımlanan font bulunamadı: \(missing)", type: .error)
                
            }
        }
    }
    
    // MARK: - Font Access
    static func font(type: FontType, size: FontSize) -> UIFont {
        let key = "\(type)-\(size)"
        if let cached = fontCache[key] { return cached }
        
        let fontName = themeFont.fontNames[type] ?? ""
        let fontSize = themeFontSize.fontSizes[size] ?? 14
        let uiFont = UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        
        fontCache[key] = uiFont
        return uiFont
    }
    
    // H1
    public static var h1_black: UIFont { font(type: .black, size: .h1) }
    public static var h1_ExtraBold: UIFont { font(type: .extraBold, size: .h1) }
    public static var h1_bold: UIFont { font(type: .bold, size: .h1) }
    public static var h1_semiBold: UIFont { font(type: .semiBold, size: .h1) }
    public static var h1_medium: UIFont { font(type: .medium, size: .h1) }
    public static var h1_regular: UIFont { font(type: .regular, size: .h1) }
    
    // H2
    public static var h2_black: UIFont { font(type: .black, size: .h2) }
    public static var h2_ExtraBold: UIFont { font(type: .extraBold, size: .h2) }
    public static var h2_bold: UIFont { font(type: .bold, size: .h2) }
    public static var h2_semiBold: UIFont { font(type: .semiBold, size: .h2) }
    public static var h2_medium: UIFont { font(type: .medium, size: .h2) }
    public static var h2_regular: UIFont { font(type: .regular, size: .h2) }
    
    // H3
    public static var h3_black: UIFont { font(type: .black, size: .h3) }
    public static var h3_ExtraBold: UIFont { font(type: .extraBold, size: .h3) }
    public static var h3_bold: UIFont { font(type: .bold, size: .h3) }
    public static var h3_semiBold: UIFont { font(type: .semiBold, size: .h3) }
    public static var h3_medium: UIFont { font(type: .medium, size: .h3) }
    public static var h3_regular: UIFont { font(type: .regular, size: .h3) }
    
    // H4
    public static var h4_black: UIFont { font(type: .black, size: .h4) }
    public static var h4_ExtraBold: UIFont { font(type: .extraBold, size: .h4) }
    public static var h4_bold: UIFont { font(type: .bold, size: .h4) }
    public static var h4_semiBold: UIFont { font(type: .semiBold, size: .h4) }
    public static var h4_medium: UIFont { font(type: .medium, size: .h4) }
    public static var h4_regular: UIFont { font(type: .regular, size: .h4) }
    
    // H5
    public static var h5_black: UIFont { font(type: .black, size: .h5) }
    public static var h5_ExtraBold: UIFont { font(type: .extraBold, size: .h5) }
    public static var h5_bold: UIFont { font(type: .bold, size: .h5) }
    public static var h5_semiBold: UIFont { font(type: .semiBold, size: .h5) }
    public static var h5_medium: UIFont { font(type: .medium, size: .h5) }
    public static var h5_regular: UIFont { font(type: .regular, size: .h5) }
    
    // Xlarge
    public static var xLarge_black: UIFont { font(type: .black, size: .xLarge) }
    public static var xLarge_ExtraBold: UIFont { font(type: .extraBold, size: .xLarge) }
    public static var xLarge_bold: UIFont { font(type: .bold, size: .xLarge) }
    public static var xLarge_semiBold: UIFont { font(type: .semiBold, size: .xLarge) }
    public static var xLarge_medium: UIFont { font(type: .medium, size: .xLarge) }
    public static var xLarge_regular: UIFont { font(type: .regular, size: .xLarge) }
    
    // Large
    public static var large_black: UIFont { font(type: .black, size: .large) }
    public static var large_ExtraBold: UIFont { font(type: .extraBold, size: .large) }
    public static var large_bold: UIFont { font(type: .bold, size: .large) }
    public static var large_semiBold: UIFont { font(type: .semiBold, size: .large) }
    public static var large_medium: UIFont { font(type: .medium, size: .large) }
    public static var large_regular: UIFont { font(type: .regular, size: .large) }
    
    // Medium
    public static var medium_black: UIFont { font(type: .black, size: .medium) }
    public static var medium_ExtraBold: UIFont { font(type: .extraBold, size: .medium) }
    public static var medium_bold: UIFont { font(type: .bold, size: .medium) }
    public static var medium_semiBold: UIFont { font(type: .semiBold, size: .medium) }
    public static var medium_medium: UIFont { font(type: .medium, size: .medium) }
    public static var medium_regular: UIFont { font(type: .regular, size: .medium) }
    
    // Small
    public static var small_black: UIFont { font(type: .black, size: .small) }
    public static var small_ExtraBold: UIFont { font(type: .extraBold, size: .small) }
    public static var small_bold: UIFont { font(type: .bold, size: .small) }
    public static var small_semiBold: UIFont { font(type: .semiBold, size: .small) }
    public static var small_medium: UIFont { font(type: .medium, size: .small) }
    public static var small_regular: UIFont { font(type: .regular, size: .small) }
    
    // XSmall
    public static var xSmall_black: UIFont { font(type: .black, size: .xSmall) }
    public static var xSmall_ExtraBold: UIFont { font(type: .extraBold, size: .xSmall) }
    public static var xSmall_bold: UIFont { font(type: .bold, size: .xSmall) }
    public static var xSmall_semiBold: UIFont { font(type: .semiBold, size: .xSmall) }
    public static var xSmall_medium: UIFont { font(type: .medium, size: .xSmall) }
    public static var xSmall_regular: UIFont { font(type: .regular, size: .xSmall) }

}
