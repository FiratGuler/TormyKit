//
//  FontConfigure.swift
//  TormyKit
//
//  Created by Fırat Güler on 9.10.2025.
//

import UIKit


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
