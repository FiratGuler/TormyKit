//
//  TormyBaseViewController.swift
//  Wordy
//
//  Created by Fırat Güler on 4.09.2025.
//

import UIKit
import SnapKit

open class TormyBaseViewController: UIViewController {
    
    open var appBackground: UIColor {
        return TormyColors.neutral900
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appBackground 
    }
    
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
//    
//    public func showPopUp(title: String, message: String, positiveButton: String, positiveAction: (() -> Void)? = nil) {
//
//
//        
//                let backgroundView = UIView()
//        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//        backgroundView.alpha = 0.0
//        view.addSubview(backgroundView)
//        backgroundView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        
//        let popUp = PopUpView(title: title, message: message, positiveButton: positiveButton, positiveAction: positiveAction)
//        
//        view.addSubview(popUp)
//        popUp.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.left.right.equalToSuperview().inset(TormyLayout.margin3x)
//            make.height.equalToSuperview().dividedBy(3)
//        }
//        
//        UIView.animate(withDuration: 0.25) {
//            backgroundView.alpha = 1.0
//        }
//
//    }
//    

}
