//
//  TormyColors.swift
//  Wordy
//
//  Created by Fırat Güler on 7.09.2025.
//

import UIKit

public struct ThemeColorConfigure {
    var background: String?
    var containerColor: String?
    var borderColor: String?
    var textFieldColor: String?
    
    var primary900: String?
    var primary800: String?
    var primary700: String?
    var primary600: String?
    var primary500: String?
    var primary400: String?
    var primary300: String?
    var primary200: String?
    var primary100: String?
    var primary50: String?
    
    var greyScale900: String?
    var greyScale800: String?
    var greyScale700: String?
    var greyScale600: String?
    var greyScale500: String?
    var greyScale400: String?
    var greyScale300: String?
    var greyScale200: String?
    var greyScale100: String?
    var greyScale50: String?
    
    var black: String?
    var white: String?
    
    var error: String?
    var success: String?
    
    init(background: String? = nil, containerColor: String? = nil, borderColor: String? = nil, textFieldColor: String? = nil, primary900: String? = nil, primary800: String? = nil, primary700: String? = nil, primary600: String? = nil, primary500: String? = nil, primary400: String? = nil, primary300: String? = nil, primary200: String? = nil, primary100: String? = nil, primary50: String? = nil, greyScale900: String? = nil, greyScale800: String? = nil, greyScale700: String? = nil, greyScale600: String? = nil, greyScale500: String? = nil, greyScale400: String? = nil, greyScale300: String? = nil, greyScale200: String? = nil, greyScale100: String? = nil, greyScale50: String? = nil, black: String? = nil, white: String? = nil, error: String? = nil, success: String? = nil) {
        self.background = background
        self.containerColor = containerColor
        self.borderColor = borderColor
        self.textFieldColor = textFieldColor
        self.primary900 = primary900
        self.primary800 = primary800
        self.primary700 = primary700
        self.primary600 = primary600
        self.primary500 = primary500
        self.primary400 = primary400
        self.primary300 = primary300
        self.primary200 = primary200
        self.primary100 = primary100
        self.primary50 = primary50
        self.greyScale900 = greyScale900
        self.greyScale800 = greyScale800
        self.greyScale700 = greyScale700
        self.greyScale600 = greyScale600
        self.greyScale500 = greyScale500
        self.greyScale400 = greyScale400
        self.greyScale300 = greyScale300
        self.greyScale200 = greyScale200
        self.greyScale100 = greyScale100
        self.greyScale50 = greyScale50
        self.black = black
        self.white = white
        self.error = error
        self.success = success
    }
}


@MainActor
public struct TormyColors {

    private static var theme: ThemeColorConfigure = ThemeColorConfigure()
    private static let defaultColor = "#F54927"

    // MARK: - Cached UIColor
    private static var _background: UIColor = UIColor(hex: defaultColor)
    private static var _containerColor: UIColor = UIColor(hex: defaultColor)
    private static var _borderColor: UIColor = UIColor(hex: defaultColor)
    private static var _textFieldColor: UIColor = UIColor(hex: defaultColor)
    
    private static var _primary900: UIColor = UIColor(hex: defaultColor)
    private static var _primary800: UIColor = UIColor(hex: defaultColor)
    private static var _primary700: UIColor = UIColor(hex: defaultColor)
    private static var _primary600: UIColor = UIColor(hex: defaultColor)
    private static var _primary500: UIColor = UIColor(hex: defaultColor)
    private static var _primary400: UIColor = UIColor(hex: defaultColor)
    private static var _primary300: UIColor = UIColor(hex: defaultColor)
    private static var _primary200: UIColor = UIColor(hex: defaultColor)
    private static var _primary100: UIColor = UIColor(hex: defaultColor)
    private static var _primary50: UIColor = UIColor(hex: defaultColor)
    
    private static var _greyScale900: UIColor = UIColor(hex: defaultColor)
    private static var _greyScale800: UIColor = UIColor(hex: defaultColor)
    private static var _greyScale700: UIColor = UIColor(hex: defaultColor)
    private static var _greyScale600: UIColor = UIColor(hex: defaultColor)
    private static var _greyScale500: UIColor = UIColor(hex: defaultColor)
    private static var _greyScale400: UIColor = UIColor(hex: defaultColor)
    private static var _greyScale300: UIColor = UIColor(hex: defaultColor)
    private static var _greyScale200: UIColor = UIColor(hex: defaultColor)
    private static var _greyScale100: UIColor = UIColor(hex: defaultColor)
    private static var _greyScale50: UIColor = UIColor(hex: defaultColor)
    
    private static var _black: UIColor = UIColor(hex: defaultColor)
    private static var _white: UIColor = UIColor(hex: defaultColor)
    
    private static var _error: UIColor = UIColor(hex: defaultColor)
    private static var _success: UIColor = UIColor(hex: defaultColor)

    private init() {}

    // MARK: - Configure
    static func configure(theme: ThemeColorConfigure) {
        self.theme = theme

        // Base
        _background = UIColor(hex: theme.background ?? defaultColor)
        _containerColor = UIColor(hex: theme.containerColor ?? defaultColor)
        _borderColor = UIColor(hex: theme.borderColor ?? defaultColor)
        _textFieldColor = UIColor(hex: theme.textFieldColor ?? defaultColor)
        
        // Primary
        _primary900 = UIColor(hex: theme.primary900 ?? defaultColor)
        _primary800 = UIColor(hex: theme.primary800 ?? defaultColor)
        _primary700 = UIColor(hex: theme.primary700 ?? defaultColor)
        _primary600 = UIColor(hex: theme.primary600 ?? defaultColor)
        _primary500 = UIColor(hex: theme.primary500 ?? defaultColor)
        _primary400 = UIColor(hex: theme.primary400 ?? defaultColor)
        _primary300 = UIColor(hex: theme.primary300 ?? defaultColor)
        _primary200 = UIColor(hex: theme.primary200 ?? defaultColor)
        _primary100 = UIColor(hex: theme.primary100 ?? defaultColor)
        _primary50 = UIColor(hex: theme.primary50 ?? defaultColor)
        
        // GreyScale
        _greyScale900 = UIColor(hex: theme.greyScale900 ?? defaultColor)
        _greyScale800 = UIColor(hex: theme.greyScale800 ?? defaultColor)
        _greyScale700 = UIColor(hex: theme.greyScale700 ?? defaultColor)
        _greyScale600 = UIColor(hex: theme.greyScale600 ?? defaultColor)
        _greyScale500 = UIColor(hex: theme.greyScale500 ?? defaultColor)
        _greyScale400 = UIColor(hex: theme.greyScale400 ?? defaultColor)
        _greyScale300 = UIColor(hex: theme.greyScale300 ?? defaultColor)
        _greyScale200 = UIColor(hex: theme.greyScale200 ?? defaultColor)
        _greyScale100 = UIColor(hex: theme.greyScale100 ?? defaultColor)
        _greyScale50 = UIColor(hex: theme.greyScale50 ?? defaultColor)
        
        // Color
        _black = UIColor(hex: theme.black ?? defaultColor)
        _white = UIColor(hex: theme.white ?? defaultColor)
        
        // Status
        _error = UIColor(hex: theme.error ?? defaultColor)
        _success = UIColor(hex: theme.success ?? defaultColor)
    }

    
    public static var background: UIColor { _background }
    public static var containerColor: UIColor { _containerColor }
    public static var borderColor: UIColor { _borderColor }
    public static var textFieldColor: UIColor { _textFieldColor }
    
    public static var primary900: UIColor { _primary900 }
    public static var primary800: UIColor { _primary800 }
    public static var primary700: UIColor { _primary700 }
    public static var primary600: UIColor { _primary600 }
    public static var primary500: UIColor { _primary500 }
    public static var primary400: UIColor { _primary400 }
    public static var primary300: UIColor { _primary300 }
    public static var primary200: UIColor { _primary200 }
    public static var primary100: UIColor { _primary100 }
    public static var primary50: UIColor { _primary50 }
    
    public static var greyScale900: UIColor { _greyScale900 }
    public static var greyScale800: UIColor { _greyScale800 }
    public static var greyScale700: UIColor { _greyScale700 }
    public static var greyScale600: UIColor { _greyScale600 }
    public static var greyScale500: UIColor { _greyScale500 }
    public static var greyScale400: UIColor { _greyScale400 }
    public static var greyScale300: UIColor { _greyScale300 }
    public static var greyScale200: UIColor { _greyScale200 }
    public static var greyScale100: UIColor { _greyScale100 }
    public static var greyScale50: UIColor { _greyScale50 }
    
    public static var black: UIColor { _black }
    public static var white: UIColor { _white }
    
    public static var error: UIColor { _error }
    public static var success: UIColor { _success }
}

