//
//  ToastView.swift
//  Wordy
//
//  Created by Fırat Güler on 7.09.2025.
//

import UIKit

final class ToastView: UIView {
    
    enum ToastStatus {
        case success
        case warning
        case error
    }
    
    private let iconView = UIImageView()
    private let label = UILabel()
    
    init(message: String, status: ToastStatus) {
        super.init(frame: .zero)
        setupUI(message: message, status: status)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func setupUI(message: String, status: ToastStatus) {
        backgroundColor = UIColor.white.withAlphaComponent(0.8)
        layer.borderWidth = 1
        layer.borderColor = TormyColors.borderColor.cgColor
        layer.cornerRadius = TormyLayout.cornerRadius
        addShadow(y: 2.0, blurRadius: 2.0)
        
        
        configureIconView(status: status)
        configureLabel(message: message)
    }
    
    private func configureIconView(status: ToastStatus) {
        iconView.contentMode = .scaleAspectFit
        
        switch status {
        case .success:
            iconView.image = TormyUIKit.safeImage("icon_circle_check")
            
        case .warning:
            iconView.image = TormyUIKit.safeImage("icon_circle_exclamation")
                .withRenderingMode(.alwaysTemplate)
            iconView.tintColor = .yellow
            
        case .error:
            iconView.image = TormyUIKit.safeImage("icon_circle_exclamation")
        }
        
        addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    private func configureLabel(message: String) {
        label.text = message
        label.textColor = TormyColors.greyScale900
        label.font = TormyFonts.medium_medium
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(iconView.snp.right).offset(8)
            make.centerY.equalToSuperview()
        }
    }
}
