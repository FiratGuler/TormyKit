//
//  TormyBaseViewController.swift
//  Wordy
//
//  Created by Fırat Güler on 4.09.2025.
//

import UIKit
import SnapKit

open class TormyBaseViewController: UIViewController {
    
    open var appBackground: UIColor { TormyColors.neutral900 }
    
    // MARK: - NavigationBar
    var previousAppearance: UINavigationBarAppearance?
    open var navigationTitleText: String { "" }
    open var navigationTitleColor: UIColor { .black }
    open var navigationTitleFont: UIFont { .boldSystemFont(ofSize: 18) }
    open var navigationBackgroundColor: UIColor? { nil }
    open var hideBackButtonText: Bool { false }
    open var navigationTintColor: UIColor? { nil }
    
    var currentToast: UIView?

    // MARK: - Lifecycle
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appBackground

    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        saveAndApplyNavigationStyle()
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        restorePreviousNavigationStyle()
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
