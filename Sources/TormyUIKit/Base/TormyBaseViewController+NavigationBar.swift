//
//  File.swift
//  TormyKit
//
//  Created by Fırat Güler on 27.09.2025.
//

import UIKit

extension TormyBaseViewController {
    
    public enum BarButtonSide {
        case left
        case right
    }    
    
    // MARK: - Configure Navigation Title
    func configureNavigationTitle() {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: navigationTitleColor,
            .font: navigationTitleFont
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationItem.title = navigationTitleText
    }
    
    // MARK: - Back Button Text Visibility
    func applyBackButtonTextVisibility() {
        if hideBackButtonText {
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backButton
        }
    }
    
    // MARK: - Set Bar Button
    public func setBarButton(side: BarButtonSide, image: UIImage, tintColor: UIColor = .systemBlue, target: Any?, action: Selector?) {
           let button = UIButton(type: .system)
           button.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
           button.tintColor = tintColor
           if let action = action {
               button.addTarget(target, action: action, for: .touchUpInside)
           }
           let barButton = UIBarButtonItem(customView: button)
           
           switch side {
           case .left:
               navigationItem.leftBarButtonItem = barButton
           case .right:
               navigationItem.rightBarButtonItem = barButton
           }
       }

}
