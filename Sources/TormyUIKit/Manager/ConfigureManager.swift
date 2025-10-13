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
    
    // MARK: - PopUp
    public func applyPopUp(_ configure: TormyPopUpStyles) {
        TormyPopUp.configure(configure)
    }
    
    
    
}
// MARK: - Navbar
extension ConfigureManager {
    // Navigation Style
    public func applyNavigationBarStyles(_ style: NavigationBarStyle) {
        globalNavigationStyle = style
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = style.backgroundColor ?? .white
        
        // Title
        var titleAttributes: [NSAttributedString.Key: Any] = [:]
        titleAttributes[.foregroundColor] = style.titleColor ?? .black
        if let font = style.titleFont {
            titleAttributes[.font] = font
        }
        appearance.titleTextAttributes = titleAttributes
        
        // Large Title
        var largeTitleAttributes: [NSAttributedString.Key: Any] = [:]
        largeTitleAttributes[.foregroundColor] = style.largeTitleColor ?? .black
        if let font = style.largeTitleFont {
            largeTitleAttributes[.font] = font
        }
        appearance.largeTitleTextAttributes = largeTitleAttributes
        
        // Back button text
        if style.hideBackButtonText {
            let backButtonAppearance = UIBarButtonItemAppearance()
            backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
            backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
            appearance.backButtonAppearance = backButtonAppearance
        }
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = style.tintColor ?? .systemBlue
    }
    /// Uygulanacak navigation bar stilini belirler (global + local override)
    public func applyNavigationStyle(_ localStyle: NavigationBarStyle? = nil,
                                     to navigationBar: UINavigationBar?) {
        guard let navBar = navigationBar else { return }
        
        let global = globalNavigationStyle
        
        let merged = merge(global: global, local: localStyle)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = merged.backgroundColor ?? .systemBackground
        
        var titleAttributes: [NSAttributedString.Key: Any] = [:]
        if let titleColor = merged.titleColor {
            titleAttributes[.foregroundColor] = titleColor
        }
        if let titleFont = merged.titleFont {
            titleAttributes[.font] = titleFont
        }
        appearance.titleTextAttributes = titleAttributes
        
        var largeTitleAttributes: [NSAttributedString.Key: Any] = [:]
        if let largeTitleColor = merged.largeTitleColor {
            largeTitleAttributes[.foregroundColor] = largeTitleColor
        }
        if let largeTitleFont = merged.largeTitleFont {
            largeTitleAttributes[.font] = largeTitleFont
        }
        appearance.largeTitleTextAttributes = largeTitleAttributes
        
        if merged.hideBackButtonText {
            let backButtonAppearance = UIBarButtonItemAppearance()
            backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
            backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
            appearance.backButtonAppearance = backButtonAppearance
        }
        
        navBar.standardAppearance = appearance
        navBar.scrollEdgeAppearance = appearance
        navBar.compactAppearance = appearance
        
        if let tintColor = merged.tintColor {
            navBar.tintColor = tintColor
        }
        
        if merged.hideBackButtonText {
            navBar.topItem?.backButtonTitle = ""
        }
    }
    
    private func merge(global: NavigationBarStyle?, local: NavigationBarStyle?) -> NavigationBarStyle {
        return NavigationBarStyle(
            backgroundColor: local?.backgroundColor ?? global?.backgroundColor,
            titleColor: local?.titleColor ?? global?.titleColor,
            largeTitleColor: local?.largeTitleColor ?? global?.largeTitleColor,
            tintColor: local?.tintColor ?? global?.tintColor,
            titleFont: local?.titleFont ?? global?.titleFont,
            largeTitleFont: local?.largeTitleFont ?? global?.largeTitleFont,
            hideBackButtonText: local?.hideBackButtonText ?? global?.hideBackButtonText ?? false
        )
    }
}
