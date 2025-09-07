//
//  TUIView+Extensions.swift
//  Wordy
//
//  Created by Fırat Güler on 4.09.2025.
//

import UIKit

extension UIView {

    // MARK: - Shadow
    
    func addShadow(
        color: UIColor = .black,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blurRadius: CGFloat = 4,
        spread: CGFloat = 0,
        opacity: Float = 0.25
    ) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blurRadius / 2
        layer.shadowOpacity = opacity
        
        if spread == 0 {
            layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    // MARK: Fade In-Out Animation
    
    func fadeInOut(
        fadeInDuration: TimeInterval = 0.3,
        visibleDuration: TimeInterval = 2.0,
        fadeOutDuration: TimeInterval = 0.3,
        completion: (() -> Void)? = nil
    ) {
        self.alpha = 0
        UIView.animate(withDuration: fadeInDuration, animations: {
            self.alpha = 1
        }) { _ in
            UIView.animate(withDuration: fadeOutDuration, delay: visibleDuration, options: [], animations: {
                self.alpha = 0
            }) { _ in
                completion?()
            }
        }
    }
}
