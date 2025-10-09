//
//  File.swift
//  TormyKit
//
//  Created by Fırat Güler on 7.09.2025.
//

import UIKit

// MARK: - Struct for Navigation Bar Style

@MainActor
public final class ConfigureManager {
    public static let shared = ConfigureManager()
    
    public var globalNavigationStyle: NavigationBarStyle?
    public var isLocalizableDebugEnabled: Bool = true
    
    private init() {}
    
    // MARK: - Colors
    public func applyColors(_ theme: ColorConfigure) {
        TormyColors.configure(theme: theme)
    }
    
    // MARK: - Font
    public func applyFont(themeFont: FontConfigure, themeFontSize: FontSizeConfigure) {
        TormyFonts.configure(themeFont: themeFont, themeFontSize: themeFontSize)
    }
    
    // MARK: - Layout
    public func applyLayout(_ layout: LayoutConfigure) {
        TormyLayout.configure(layout)
    }
    
    // MARK: - Navigation Style
    public func applyNavigationBarStyles(_ style: NavigationBarStyle) {
        globalNavigationStyle = style
        
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
        
        // Back button text’i gizle
        if style.hideBackButtonText {
            let backButtonAppearance = UIBarButtonItemAppearance()
            backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
            backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
            appearance.backButtonAppearance = backButtonAppearance
        }
        
        // Apply
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        
        // Tint
        UINavigationBar.appearance().tintColor = style.tintColor ?? .systemBlue
        
        
    }

}

