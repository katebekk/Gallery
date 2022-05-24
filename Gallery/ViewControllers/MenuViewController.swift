//
//  ViewController.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 06.02.2022.
//

import UIKit

final class MenuViewController: UIViewController {
    // MARK: - Properties
    private var galleryCityButton = MenuButton(title: "Города", color: .gray)
    private var galleryCatsButton = MenuButton(title: "Коты", color: .systemPink)
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Меню"
        setupViews()
        setupButtons()
        setupLayouts()
    }
    
    // MARK: - Functions
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(galleryCityButton)
        view.addSubview(galleryCatsButton)
    }
    
    private func setupButtons() {
        galleryCityButton.addTarget(self, action: #selector(goToCityGalleryView), for: .touchUpInside)
        galleryCatsButton.addTarget(self, action: #selector(goToCatsGalleryView), for: .touchUpInside)
    }
    
    @objc private func goToCityGalleryView(sender: UIButton) {
        let viewController = GalleryViewController(galleryItemsList: GalleryItem.imagesCityUrls, title: "Города")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func goToCatsGalleryView(sender: UIButton) {
        let viewController = GalleryViewController(galleryItemsList: GalleryItem.imagesCatsUrls, title: "Коты")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setupLayouts() {
        galleryCityButton.translatesAutoresizingMaskIntoConstraints = false
        galleryCatsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            galleryCityButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            galleryCityButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -20),
            galleryCityButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1/2),
        ])
        
        NSLayoutConstraint.activate([
            galleryCatsButton.topAnchor.constraint(equalTo: galleryCityButton.bottomAnchor,constant: 20),
            galleryCatsButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            galleryCatsButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1/2),
        ])
    }
}

