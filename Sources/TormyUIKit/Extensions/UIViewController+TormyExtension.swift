//
//  UIViewController+Extensions.swift
//  Wordy
//
//  Created by Fırat Güler on 4.09.2025.
//

import UIKit

public extension UIViewController {
    
    func dismissKeyboardOnTap() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
}
