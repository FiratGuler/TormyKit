//
//  TormyBaseViewController.swift
//  Wordy
//
//  Created by Fırat Güler on 4.09.2025.
//

import UIKit
import SnapKit

open class TormyBaseViewController: UIViewController {
    
    public enum BarButtonSide {
        case left
        case right
    }
    
    open var appBackground: UIColor { TormyColors.neutral900 }

    var currentToast: UIView?

    // MARK: - Lifecycle
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appBackground

    }
   
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var style = NavigationBarStyle()
        style.backgroundColor = navigationBarBackground()
        style.titleColor = navigationBarTitleColor()
        style.largeTitleColor = navigationBarLargeTitleColor()
        style.tintColor = navigationBarTintColor()
        style.titleFont = navigationBarTitleFont()
        style.largeTitleFont = navigationBarLargeTitleFont()
        style.hideBackButtonText = navigationBarHideBackText()
        
        ConfigureManager.shared.applyNavigationStyle(style, to: navigationController?.navigationBar)
        
        if let navTitle = navigationBarTitle() {
            navigationItem.title = navTitle
        }
        
        if style.hideBackButtonText {
            if #available(iOS 14.0, *) {
                navigationItem.backButtonDisplayMode = .minimal
            }
            navigationController?.navigationBar.topItem?.backButtonTitle = ""
        }
    }

    
    // MARK: - Navigation Bar
    
    open func navigationBarTitle() -> String? {
        return nil
    }

    open func navigationBarBackground() -> UIColor? {
        return ConfigureManager.shared.globalNavigationStyle?.backgroundColor
    }

    open func navigationBarTitleColor() -> UIColor? {
        return ConfigureManager.shared.globalNavigationStyle?.titleColor
    }

    open func navigationBarLargeTitleColor() -> UIColor? {
        return ConfigureManager.shared.globalNavigationStyle?.largeTitleColor
    }

    open func navigationBarTintColor() -> UIColor? {
        return ConfigureManager.shared.globalNavigationStyle?.tintColor
    }

    open func navigationBarTitleFont() -> UIFont? {
        return ConfigureManager.shared.globalNavigationStyle?.titleFont
    }

    open func navigationBarLargeTitleFont() -> UIFont? {
        return ConfigureManager.shared.globalNavigationStyle?.largeTitleFont
    }

    open func navigationBarHideBackText() -> Bool {
        return ConfigureManager.shared.globalNavigationStyle?.hideBackButtonText ?? false
    }
    
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
    
    // MARK: - Keybord Dismiss
    public func addTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
