//
//  TormyPopUpStyles.swift
//  TormyKit
//
//  Created by Fırat Güler on 13.10.2025.
//

import UIKit

public struct TormyPopUpStyles {
    public var backgroundColor: UIColor
    public var titleColor: UIColor
    public var messageColor: UIColor
    public var titleFont: UIFont
    public var messageFont: UIFont
    public var positiveButtonBackground: UIColor
    public var negativeButtonBackground: UIColor
    public var positiveButtonTitleColor: UIColor
    public var negativeButtonTitleColor: UIColor
    public var cornerRadius: CGFloat
    
    public init(backgroundColor: UIColor = .white,
                titleColor: UIColor = .black,
                messageColor: UIColor = .darkGray,
                titleFont: UIFont = .boldSystemFont(ofSize: 18),
                messageFont: UIFont = .systemFont(ofSize: 16),
                positiveButtonBackground: UIColor = .systemBlue,
                negativeButtonBackground: UIColor = .lightGray,
                positiveButtonTitleColor: UIColor = .white,
                negativeButtonTitleColor: UIColor = .black,
                cornerRadius: CGFloat = 12) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.messageColor = messageColor
        self.titleFont = titleFont
        self.messageFont = messageFont
        self.positiveButtonBackground = positiveButtonBackground
        self.negativeButtonBackground = negativeButtonBackground
        self.positiveButtonTitleColor = positiveButtonTitleColor
        self.negativeButtonTitleColor = negativeButtonTitleColor
        self.cornerRadius = cornerRadius
    }
}
