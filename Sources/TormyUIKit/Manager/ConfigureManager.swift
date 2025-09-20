//
//  File.swift
//  TormyKit
//
//  Created by Fırat Güler on 7.09.2025.
//

import UIKit


import UIKit

// MARK: - Struct for Navigation Bar Style
public struct NavigationBarStyle {
    public var backgroundColor: UIColor?
    public var titleColor: UIColor?
    public var largeTitleColor: UIColor?
    public var tintColor: UIColor?   
    public var titleFont: UIFont?
    public var largeTitleFont: UIFont?
    
    public init(backgroundColor: UIColor? = nil,
                titleColor: UIColor? = nil,
                largeTitleColor: UIColor? = nil,
                tintColor: UIColor? = nil,
                titleFont: UIFont? = nil,
                largeTitleFont: UIFont? = nil) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.largeTitleColor = largeTitleColor
        self.tintColor = tintColor
        self.titleFont = titleFont
        self.largeTitleFont = largeTitleFont
    }
}

@MainActor
public final class ConfigureManager {
    public static let shared = ConfigureManager()
    
    public var localizableDebug: Bool { true }
    
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
    
    public func applyNavigationBarStyles(_ style: NavigationBarStyle) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // Background
        if let bgColor = style.backgroundColor {
            appearance.backgroundColor = bgColor
        } else {
            appearance.backgroundColor = .white
        }
        
        // Title
        var titleAttributes: [NSAttributedString.Key: Any] = [:]
        if let titleColor = style.titleColor {
            titleAttributes[.foregroundColor] = titleColor
        } else {
            titleAttributes[.foregroundColor] = UIColor.black
        }
        if let titleFont = style.titleFont {
            titleAttributes[.font] = titleFont
        }
        appearance.titleTextAttributes = titleAttributes
        
        // Large title
        var largeTitleAttributes: [NSAttributedString.Key: Any] = [:]
        if let largeTitleColor = style.largeTitleColor {
            largeTitleAttributes[.foregroundColor] = largeTitleColor
        } else {
            largeTitleAttributes[.foregroundColor] = UIColor.black
        }
        if let largeTitleFont = style.largeTitleFont {
            largeTitleAttributes[.font] = largeTitleFont
        }
        appearance.largeTitleTextAttributes = largeTitleAttributes
        
        // Apply
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        
        // Tint
        UINavigationBar.appearance().tintColor = style.tintColor ?? .systemBlue
    }

}

