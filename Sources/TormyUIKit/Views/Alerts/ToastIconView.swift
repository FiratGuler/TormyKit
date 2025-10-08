//
//  File.swift
//  TormyKit
//
//  Created by Fırat Güler on 8.10.2025.
//

import UIKit
import SnapKit

public final class ToastIconView: UIView {
    
    public enum ToastIconStatus {
        case success
        case error
        case loading
        
        var iconName: String? {
            switch self {
            case .success: return "checkmark.circle"
            case .error: return "exclamationmark.circle"
            case .loading: return nil
            }
        }
    }
    
    private let circleView = UIView()
    private let iconImageView = UIImageView()
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    private var size: CGFloat = 60
    
    public init(status: ToastIconStatus, size: CGFloat = 40) {
        self.size = size
        super.init(frame: .zero)
        setupUI(status: status)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(status: ToastIconStatus) {
        backgroundColor = .clear
        
        // Circle
        addSubview(circleView)
        circleView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(size)
        }
        circleView.backgroundColor = .black
        circleView.layer.cornerRadius = size / 2
        circleView.clipsToBounds = true
        
        // Icon ve Indicator
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .white
        
        circleView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(size * 0.5)
        }

        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        
        circleView.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(size * 0.5)
        }

        
        // Başlangıç durumu
        switch status {
        case .success, .error:
            iconImageView.isHidden = false
            activityIndicator.stopAnimating()
            if let name = status.iconName {
                iconImageView.image = UIImage(systemName: name)?.withRenderingMode(.alwaysTemplate)
            }
        case .loading:
            iconImageView.isHidden = true
            activityIndicator.startAnimating()
        }
    }
    
    public func updateStatus(_ status: ToastIconStatus, autoDismissAfter: TimeInterval = 1.5) {
        switch status {
        case .success, .error:
            activityIndicator.stopAnimating()
            iconImageView.isHidden = false
            if let name = status.iconName {
                iconImageView.image = UIImage(systemName: name)?.withRenderingMode(.alwaysTemplate)
            }
            
            let targetColor: UIColor = (status == .success) ? TormyColors.success : TormyColors.error
            
            UIView.animate(withDuration: 0.3, animations: {
                self.circleView.backgroundColor = targetColor
            })
            
            UIView.animate(withDuration: 0.3, delay: autoDismissAfter, options: [.curveEaseInOut], animations: {
                self.alpha = 0
            }) { _ in
                self.removeFromSuperview()
            }
            
        case .loading:
            iconImageView.isHidden = true
            activityIndicator.startAnimating()
            UIView.animate(withDuration: 0.3) {
                self.circleView.backgroundColor = .black
            }
        }
    }
}

