//
//  File.swift
//  TormyKit
//
//  Created by Fırat Güler on 8.09.2025.
//

import UIKit
import SnapKit

public final class PopUpView: UIView {

    // MARK: - Button Actions
    public var positiveAction: (() -> Void)?
    public var negativeAction: (() -> Void)?

    // Internal button tap closures
    public var positiveButtonAction: (() -> Void)?
    public var negativeButtonAction: (() -> Void)?

    public let positiveButton = UIButton()
    public let negativeButton = UIButton()
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()

    // MARK: - Init
    public init(title: String,
                message: String,
                positiveButton: String,
                positiveAction: (() -> Void)? = nil,
                negativeButton: String? = nil,
                negativeAction: (() -> Void)? = nil) {
        super.init(frame: .zero)

        self.positiveAction = positiveAction
        self.negativeAction = negativeAction

        setupUI(title: title, message: message, positiveTitle: positiveButton, negativeTitle: negativeButton)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - UI Setup
    private func setupUI(title: String, message: String, positiveTitle: String, negativeTitle: String?) {

        backgroundColor = UIColor.white
        layer.cornerRadius = 12
        clipsToBounds = true

        // Title
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(16)
        }

        // Message
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.numberOfLines = 0
        addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(16)
        }

        // Positive Button
        positiveButton.setTitle(positiveTitle, for: .normal)
        positiveButton.backgroundColor = UIColor.systemBlue
        positiveButton.layer.cornerRadius = 8
        positiveButton.addTarget(self, action: #selector(positiveTapped), for: .touchUpInside)
        addSubview(positiveButton)
        positiveButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }

        // Negative Button (opsiyonel)
        if let negativeTitle = negativeTitle {
            negativeButton.setTitle(negativeTitle, for: .normal)
            negativeButton.backgroundColor = UIColor.lightGray
            negativeButton.layer.cornerRadius = 8
            negativeButton.addTarget(self, action: #selector(negativeTapped), for: .touchUpInside)
            addSubview(negativeButton)
            negativeButton.snp.makeConstraints { make in
                make.top.equalTo(positiveButton.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(44)
                make.bottom.equalToSuperview().offset(-20)
            }
        } else {
            positiveButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-20)
            }
        }
    }

    // MARK: - Button Actions
    @objc private func positiveTapped() { positiveButtonAction?() }
    @objc private func negativeTapped() { negativeButtonAction?() }

}


//import UIKit
//
//public final class PopUpView: UIView {
//    
//    private let titleLabel = UILabel()
//    private let messageLabel = UILabel()
//    private let positiveButton = UIButton()
//    private let negativeButton = UIButton()
//    
//    private var positiveAction: (() -> Void)?
//    private var negativeAction: (() -> Void)?
//    
//    // MARK: - Base Init
//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Convenience Initializers
//    
//    /// Sadece pozitif buton
//    public convenience init(title: String, message: String, positiveButton: String, positiveAction: (() -> Void)? = nil) {
//        self.init(frame: .zero)
//        self.positiveAction = positiveAction
//        setupUI(title: title, message: message, positiveButtonTitle: positiveButton)
//    }
//    
//    /// Pozitif + Negatif buton
//    public convenience init(title: String, message: String, positiveButton: String, positiveAction: (() -> Void)? = nil,
//                            negativeButton: String, negativeAction: (() -> Void)? = nil) {
//        self.init(frame: .zero)
//        self.positiveAction = positiveAction
//        self.negativeAction = negativeAction
//        setupUI(title: title, message: message,
//                positiveButtonTitle: positiveButton,
//                negativeButtonTitle: negativeButton)
//    }
//    
//    // MARK: - Setup
//
//    private func setupUI(title: String, message: String, positiveButtonTitle: String, negativeButtonTitle: String? = nil) {
//        configureView()
//        configureTitle(title)
//        configureMessage(message)
//        configurePositiveButton(positiveButtonTitle)
//        
//        if let text = negativeButtonTitle {
//            configureNegativeButton(text)
//        }
//    }
//    
//    // MARK: - Configures
//    
//    private func configureView() {
//        backgroundColor = TormyColors.neutral200
//        layer.cornerRadius = TormyLayout.cornerRadius
//    }
//    
//    private func configureTitle(_ text: String) {
//        titleLabel.text = text
//        titleLabel.font = TormyFonts.h5_bold
//        titleLabel.textColor = TormyColors.greyScale900
//        
//        addSubview(titleLabel)
//        titleLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().inset(TormyLayout.margin3x)
//        }
//    }
//    
//    private func configureMessage(_ text: String) {
//        messageLabel.text = text
//        messageLabel.font = TormyFonts.h5_bold
//        messageLabel.textColor = TormyColors.greyScale800
//        
//        addSubview(messageLabel)
//        messageLabel.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(TormyLayout.margin)
//            make.left.right.equalToSuperview().inset(TormyLayout.margin3x)
//        }
//    }
//    
//    private func configurePositiveButton(_ text: String) {
//        positiveButton.setTitle(text, for: .normal)
//        positiveButton.setTitleColor(TormyColors.white, for: .normal)
//        positiveButton.titleLabel?.font = TormyFonts.small_regular
//        
//        positiveButton.backgroundColor = TormyColors.primary900
//        positiveButton.layer.cornerRadius = TormyLayout.cornerRadius
//        
//        addSubview(positiveButton)
//        positiveButton.snp.makeConstraints { make in
//            make.top.equalTo(messageLabel.snp.bottom).offset(TormyLayout.margin4x)
//            make.left.right.equalToSuperview().inset(TormyLayout.margin3x)
//            make.height.equalTo(TormyLayout.buttonHeight)
//        }
//        
//        positiveButton.addTarget(self, action: #selector(handlePositiveTap), for: .touchUpInside)
//    }
//    
//    private func configureNegativeButton(_ text: String) {
//        negativeButton.setTitle(text, for: .normal)
//        negativeButton.setTitleColor(TormyColors.primary900, for: .normal)
//        negativeButton.titleLabel?.font = TormyFonts.small_regular
//        
//        negativeButton.backgroundColor = TormyColors.greyScale200
//        negativeButton.layer.cornerRadius = TormyLayout.cornerRadius
//        
//        addSubview(negativeButton)
//        negativeButton.snp.makeConstraints { make in
//            make.top.equalTo(positiveButton.snp.bottom).offset(12)
//            make.left.right.equalToSuperview().inset(TormyLayout.margin3x)
//            make.height.equalTo(TormyLayout.buttonHeight)
//        }
//        
//        negativeButton.addTarget(self, action: #selector(handleNegativeTap), for: .touchUpInside)
//    }
//    
//    // MARK: - Actions
//    @objc private func handlePositiveTap() {
//        positiveAction?()
//    }
//
//    @objc private func handleNegativeTap() {
//        negativeAction?()
//    }
//
//  
//}
