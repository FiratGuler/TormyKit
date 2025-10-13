//
//  File.swift
//  TormyKit
//
//  Created by Fırat Güler on 9.10.2025.
//

import UIKit

extension TormyBaseViewController {    
    /// Tek fonksiyon ile hem mesajlı toast hem icon toast gösterebilirsin
    /// - Parameters:
    ///   - message: klasik toast göstermek istiyorsan text
    ///   - toastStatus: klasik toast ise status
    ///   - iconStatus: icon toast göstermek istiyorsan status
    ///   - size: Icon toast boyutu
    ///   - duration: Görünür kalma süresi
    @discardableResult
    public func showToast(message: String? = nil,
                          toastStatus: ToastView.ToastStatus? = nil,
                          iconStatus: ToastIconView.ToastIconStatus? = nil,
                          size: CGFloat = 60,
                          duration: TimeInterval = 2.3) -> UIView? {
        
        // Önce eski toast'ı kaldır
        currentToast?.removeFromSuperview()
        currentToast = nil
        
        if let iconStatus = iconStatus {
            // Icon toast
            let toast = ToastIconView(status: iconStatus, size: size)
            toast.alpha = 0
            toast.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            view.addSubview(toast)
            toast.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(TormyLayout.toastTopPadding)
                make.centerX.equalToSuperview()
                make.height.equalTo(TormyLayout.toastHeight)
                make.left.right.equalToSuperview().inset(TormyLayout.toastTopPadding)
            }
            
            UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseOut]) {
                toast.alpha = 1
                toast.transform = .identity
            }
            
            currentToast = toast
            return toast
        }
        
        if let message = message, let status = toastStatus {
            // Klasik mesaj toast
            let toast = ToastView(message: message, status: status)
            view.addSubview(toast)
            toast.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(TormyLayout.toastTopPadding)
                make.centerX.equalToSuperview()
                make.height.equalTo(TormyLayout.toastHeight)
                make.left.right.equalToSuperview().inset(TormyLayout.toastTopPadding)
            }
            
            toast.fadeInOut(visibleDuration: duration) {
                toast.removeFromSuperview()
                if self.currentToast === toast {
                    self.currentToast = nil
                }
            }
            
            currentToast = toast
            return toast
        }
        
        return nil
    }
    
    /// Mevcut icon toast'u güncelle
    public func updateToastIcon(to status: ToastIconView.ToastIconStatus, autoDismissAfter: TimeInterval = 1.5) {
        // Eğer currentToast bir ToastIconView ise
        if let toastIcon = currentToast as? ToastIconView {
            toastIcon.updateStatus(status, autoDismissAfter: autoDismissAfter)
        }
    }
    
    
    // MARK: PopUp
    public func showPopUp(title: String,
                          message: String,
                          positiveButton: String,
                          positiveAction: (() -> Void)? = nil,
                          negativeButton: String? = nil,
                          negativeAction: (() -> Void)? = nil) {
        
        let popup = TormyPopUpView(title: title,
                              message: message,
                              positiveButton: positiveButton,
                              positiveAction: positiveAction,
                              negativeButton: negativeButton,
                              negativeAction: negativeAction)
        
        let popupVC = TormyPopUpViewController(popup: popup)
        present(popupVC, animated: true)
    }
}
