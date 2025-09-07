//
//  TormyBaseViewController.swift
//  Wordy
//
//  Created by Fırat Güler on 4.09.2025.
//

import UIKit
import SnapKit

public class TormyBaseController: UIViewController {

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
    
    
    
    
    
}
