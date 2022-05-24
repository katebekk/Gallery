//
//  MenuButton.swift
//  Gallery
//
//  Created by bekkerman on 18.03.2022.
//

import UIKit

final class MenuButton: UIButton {
    init(title: String, color: UIColor) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.setTitle(title, for: .normal)
        self.backgroundColor = color
        self.layer.cornerRadius = 5.0
        self.setTitleColor(.white, for: .normal)
        self.startAnimatingPressActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Button animation
extension MenuButton {
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut]) {
            button.transform = transform
        }
    }
}

