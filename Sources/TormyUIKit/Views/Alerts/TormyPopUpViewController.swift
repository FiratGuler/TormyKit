//
//  File.swift
//  TormyKit
//
//  Created by Fırat Güler on 8.09.2025.
//

import UIKit
import SnapKit

public final class TormyPopUpViewController: UIViewController {

    private let popup: TormyPopUpView
    private let backgroundView = UIView()

    // MARK: - Init
    public init(popup: TormyPopUpView) {
        self.popup = popup
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupPopup()
        animateIn()
    }

    // MARK: - Setup
    private func setupBackground() {
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        backgroundView.alpha = 0
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        backgroundView.addGestureRecognizer(tapGesture)
    }

    private func setupPopup() {
        view.addSubview(popup)
        popup.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(30)
        }

        popup.positiveButtonAction = { [weak self] in
            self?.dismissPopup()
            self?.popup.positiveAction?()
        }
        popup.negativeButtonAction = { [weak self] in
            self?.dismissPopup()
            self?.popup.negativeAction?()
        }
    }

    // MARK: - Animations
    private func animateIn() {
        popup.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        popup.alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.backgroundView.alpha = 1
            self.popup.alpha = 1
            self.popup.transform = .identity
        }
    }

    private func animateOut(completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundView.alpha = 0
            self.popup.alpha = 0
            self.popup.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { _ in
            completion?()
            self.dismiss(animated: false)
        }
    }

    @objc private func dismissPopup() {
        animateOut()
    }
}
