//
//  MenuButton.swift
//  Gallery
//
//  Created by bekkerman on 18.03.2022.
//

import UIKit

final class MenuButton: UIButton {
    private enum Constants {
        static let width = 100
        static let height = 100
        static let cornerRadius = 5.0
        static let scale = 0.95
    }

    init(title: String, color: UIColor) {
        super.init(frame: CGRect(x: 0, y: 0, width: Constants.width, height: Constants.height))
        self.setTitle(title, for: .normal)
        self.backgroundColor = color
        self.layer.cornerRadius = Constants.cornerRadius
        self.setTitleColor(.white, for: .normal)
        self.startAnimatingPressActions()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Button animation
private extension MenuButton {
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }

    @objc func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: Constants.scale, y: Constants.scale))
    }

    @objc func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }

    func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut]) {
            button.transform = transform
        }
    }
}
