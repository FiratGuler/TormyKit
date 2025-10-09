//
//  NavigationBarStyle.swift
//  TormyKit
//
//  Created by Fırat Güler on 9.10.2025.
//

import UIKit

public struct NavigationBarStyle {
    public var backgroundColor: UIColor?
    public var titleColor: UIColor?
    public var largeTitleColor: UIColor?
    public var tintColor: UIColor?
    public var titleFont: UIFont?
    public var largeTitleFont: UIFont?
    public var hideBackButtonText: Bool
    
    public init(backgroundColor: UIColor? = nil, titleColor: UIColor? = nil, largeTitleColor: UIColor? = nil, tintColor: UIColor? = nil, titleFont: UIFont? = nil, largeTitleFont: UIFont? = nil, hideBackButtonText: Bool = false ) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.largeTitleColor = largeTitleColor
        self.tintColor = tintColor
        self.titleFont = titleFont
        self.largeTitleFont = largeTitleFont
        self.hideBackButtonText = hideBackButtonText
    }
}
