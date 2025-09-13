//
//  File.swift
//  TormyKit
//
//  Created by Fırat Güler on 12.09.2025.
//

import UIKit

public extension UILabel {
    
    func setTormy(text: String, font: UIFont, color: UIColor, aligment: NSTextAlignment = .natural) {
        self.text = text
        self.font = font
        self.textColor = color
        self.textAlignment = aligment
    }
}
