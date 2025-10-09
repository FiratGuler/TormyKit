//
//  ToastView.swift
//  Wordy
//
//  Created by Fırat Güler on 7.09.2025.
//

import UIKit

public final class ToastView: UIView {
    
    public enum ToastStatus {
        case success
        case warning
        case error
        
        var iconName: String {
            switch self {
            case .success: return "icon_circle_check"
            case .warning: return "icon_circle_exclamation"
            case .error: return "icon_circle_exclamation"
            }
        }
    }
    
    private let iconView = UIImageView()
    private let label = UILabel()
    
    public init(message: String, status: ToastStatus) {
        super.init(frame: .zero)
        setupUI(message: message, status: status)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func setupUI(message: String, status: ToastStatus) {
        backgroundColor = TormyColors.neutral300
        layer.cornerRadius = TormyLayout.cornerRadius
        addShadow(y: 2.0, blurRadius: 2.0)
        
        
        configureIconView(status: status)
        configureLabel(message: message)
    }
    
    private func configureIconView(status: ToastStatus) {
        iconView.contentMode = .scaleAspectFit
        iconView.image = UIImage(named: status.iconName, in: .module, compatibleWith: nil)
        
        if status == .warning {
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = TormyColors.warning
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
        label.numberOfLines = 0           // Çok satırlı
        label.lineBreakMode = .byWordWrapping
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(iconView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-16) 
            make.top.equalToSuperview().offset(8)     
            make.bottom.equalToSuperview().offset(-8)
        }
    }
}
