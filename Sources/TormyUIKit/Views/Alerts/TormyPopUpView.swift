//
//  TormyPopUpView.swift
//  TormyKit
//
//  Created by Fırat Güler on 8.09.2025.
//

import UIKit
import SnapKit

public final class TormyPopUpView: UIView {

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
        let theme = TormyPopUp.current
        
        backgroundColor = theme.backgroundColor
        layer.cornerRadius = theme.cornerRadius
        clipsToBounds = true

        // Title
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = theme.titleFont
        titleLabel.textColor = theme.titleColor
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(16)
        }

        // Message
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.font = theme.messageFont
        messageLabel.textColor = theme.messageColor
        messageLabel.numberOfLines = 0
        addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(16)
        }

        // Positive Button
        positiveButton.setTitle(positiveTitle, for: .normal)
        positiveButton.backgroundColor = theme.positiveButtonBackground
        positiveButton.setTitleColor(theme.positiveButtonTitleColor, for: .normal)
        positiveButton.layer.cornerRadius = 8
        positiveButton.addTarget(self, action: #selector(positiveTapped), for: .touchUpInside)
        addSubview(positiveButton)
        positiveButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }

        // Negative Button
        if let negativeTitle = negativeTitle {
            negativeButton.setTitle(negativeTitle, for: .normal)
            negativeButton.backgroundColor = theme.negativeButtonBackground
            negativeButton.setTitleColor(theme.negativeButtonTitleColor, for: .normal)
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
