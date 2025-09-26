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
    open var navigationTitleText: String { "" }
    open var navigationTitleColor: UIColor { TormyColors.primary900 }
    open var navigationTitleFont: UIFont { TormyFonts.h4_bold }
    open var hideBackButtonText: Bool { false }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appBackground
        configureNavigationTitle()
        applyBackButtonTextVisibility()
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
    
    // MARK: - Alert
    // MARK: Toast
    public func showToast(message: String, status: ToastView.ToastStatus, duration: TimeInterval = 2.3) {
        let toastView = ToastView(message: message, status: status)
        
        view.addSubview(toastView)
        toastView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(TormyLayout.toastTopPadding)
            make.centerX.equalToSuperview()
            make.height.equalTo(TormyLayout.toastHeight)
            make.left.right.equalToSuperview().inset(TormyLayout.toastTopPadding)
        }
        
        toastView.fadeInOut(visibleDuration: duration) {
            toastView.removeFromSuperview()
        }
    }
    
    // MARK: PopUp
    public func showPopUp(title: String,
                          message: String,
                          positiveButton: String,
                          positiveAction: (() -> Void)? = nil,
                          negativeButton: String? = nil,
                          negativeAction: (() -> Void)? = nil) {
        
        let popup = PopUpView(title: title,
                              message: message,
                              positiveButton: positiveButton,
                              positiveAction: positiveAction,
                              negativeButton: negativeButton,
                              negativeAction: negativeAction)
        
        let popupVC = PopUpViewController(popup: popup)
        present(popupVC, animated: true)
    }
    
}
