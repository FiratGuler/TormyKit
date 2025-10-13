//
//  TormyPopUp.swift
//  TormyKit
//
//  Created by Fırat Güler on 13.10.2025.
//

import UIKit

@MainActor
public final class TormyPopUp {
    
    private static var config = TormyPopUpStyles()
    
    public static func configure(_ config: TormyPopUpStyles) {
        self.config = config
    }
    
    public static var current: TormyPopUpStyles {
        return config
    }
}
