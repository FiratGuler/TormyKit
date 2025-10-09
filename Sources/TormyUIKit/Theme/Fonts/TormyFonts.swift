//
//  TormyFonts.swift
//  TormyKit
//
//  Created by Fırat Güler on 9.10.2025.
//

import UIKit

@MainActor
public struct TormyFonts {
    
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
            TCore.log("Tüm fontlar başarıyla tanımlandı", type: .config)

        } else {
            for missing in missingFonts {
                TCore.log("Tanımlanan font bulunamadı: \(missing)", type: .error)
                
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
    }
