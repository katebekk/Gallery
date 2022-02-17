//
//  ViewController.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 06.02.2022.
//

import UIKit

class ViewController: UIViewController {
    lazy var galleryButton: UIButton = {
        var button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        button.setTitle("Plain", for: .normal)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 5.0
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(goToSecondView), for: .touchDown)
        return button
    }()
    
    @objc private func goToSecondView() {
        let secondVC = SecondViewController()
        view.backgroundColor = UIColor.white
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(galleryButton)
        view.addSubview(imageView)
    }

    private func setupLayouts() {
        galleryButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        // Layout constraints for `galleryButton`
        NSLayoutConstraint.activate([
            galleryButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            galleryButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 20),
            imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
        
    }

}
