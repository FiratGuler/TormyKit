//
//  TormyFonts.swift
//  Wordy
//
//  Created by Fırat Güler on 7.09.2025.
//

import UIKit

struct TormyFonts {
    enum FontType: String {
        case bold = "Nunito-Bold"
        case semiBold = "Nunito-SemiBold"
        case medium = "Nunito-Medium"
        case regular = "Nunito-Regular"
    }
    
    enum FontSize: CGFloat {
        case h1 = 48
        case h2 = 40
        case h3 = 32
        case h4 = 24
        case h5 = 20
        case xLarge = 18
        case large = 16
        case medium = 14
        case small = 12
        case xSmall = 10
    }
    
    
    private static func customFont(type: FontType, size: FontSize) -> UIFont {
        return UIFont(name: type.rawValue, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
    }
    
    private init() {}
    
    // H1
    static var h1_bold: UIFont { customFont(type: .bold, size: .h1) }
    static var h1_semiBold: UIFont { customFont(type: .semiBold, size: .h1) }
    static var h1_medium: UIFont { customFont(type: .medium, size: .h1) }
    static var h1_regular: UIFont { customFont(type: .regular, size: .h1) }
    
    // H2
    static var h2_bold: UIFont { customFont(type: .bold, size: .h2) }
    static var h2_semiBold: UIFont { customFont(type: .semiBold, size: .h2) }
    static var h2_medium: UIFont { customFont(type: .medium, size: .h2) }
    static var h2_regular: UIFont { customFont(type: .regular, size: .h2) }
    
    // H3
    static var h3_bold: UIFont { customFont(type: .bold, size: .h3) }
    static var h3_semiBold: UIFont { customFont(type: .semiBold, size: .h3) }
    static var h3_medium: UIFont { customFont(type: .medium, size: .h3) }
    static var h3_regular: UIFont { customFont(type: .regular, size: .h3) }
    
    // H4
    static var h4_bold: UIFont { customFont(type: .bold, size: .h4) }
    static var h4_semiBold: UIFont { customFont(type: .semiBold, size: .h4) }
    static var h4_medium: UIFont { customFont(type: .medium, size: .h4) }
    static var h4_regular: UIFont { customFont(type: .regular, size: .h4) }
    
    // H5
    static var h5_bold: UIFont { customFont(type: .bold, size: .h5) }
    static var h5_semiBold: UIFont { customFont(type: .semiBold, size: .h5) }
    static var h5_medium: UIFont { customFont(type: .medium, size: .h5) }
    static var h5_regular: UIFont { customFont(type: .regular, size: .h5) }
    
    // Xlarge
    static var xLarge_bold: UIFont { customFont(type: .bold, size: .xLarge) }
    static var xLarge_semiBold: UIFont { customFont(type: .semiBold, size: .xLarge) }
    static var xLarge_medium: UIFont { customFont(type: .medium, size: .xLarge) }
    static var xLarge_regular: UIFont { customFont(type: .regular, size: .xLarge) }
    
    // Large
    static var large_bold: UIFont { customFont(type: .bold, size: .large) }
    static var large_semiBold: UIFont { customFont(type: .semiBold, size: .large) }
    static var large_medium: UIFont { customFont(type: .medium, size: .large) }
    static var large_regular: UIFont { customFont(type: .regular, size: .large) }
    
    // Medium
    static var medium_bold: UIFont { customFont(type: .bold, size: .medium) }
    static var medium_semiBold: UIFont { customFont(type: .semiBold, size: .medium) }
    static var medium_medium: UIFont { customFont(type: .medium, size: .medium) }
    static var medium_regular: UIFont { customFont(type: .regular, size: .medium) }
    
    // Small
    static var small_bold: UIFont { customFont(type: .bold, size: .small) }
    static var small_semiBold: UIFont { customFont(type: .semiBold, size: .small) }
    static var small_medium: UIFont { customFont(type: .medium, size: .small) }
    static var small_regular: UIFont { customFont(type: .regular, size: .small) }
    
    // XSmall
    static var xSmall_bold: UIFont { customFont(type: .bold, size: .xSmall) }
    static var xSmall_semiBold: UIFont { customFont(type: .semiBold, size: .xSmall) }
    static var xSmall_medium: UIFont { customFont(type: .medium, size: .xSmall) }
    static var xSmall_regular: UIFont { customFont(type: .regular, size: .xSmall) }

}
