//
//  MenuViewController.swift
//  Gallery
//
//  Created by Kate Bekkerman on 20/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController {
    private enum Constants {
        static let menuViewTitle = "Меню"
        static let cityTitle = "Города"
        static let catsTitle = "Коты"

        static let cityButtonColor: UIColor = .gray
        static let catsButtonColor: UIColor = .systemPink
    }

    // MARK: - Properties
    var module: MenuModule!
    var output: MenuViewOutput!

    private let galleryCityButton = MenuButton(title: Constants.cityTitle, color: Constants.cityButtonColor)
    private let galleryCatsButton = MenuButton(title: Constants.catsTitle, color: Constants.catsButtonColor)

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
}

extension MenuViewController: MenuViewInput {
    func configureView() {
        setupSelf()
        setupViews()
        setupActions()
        setupLayouts()
    }
}

// MARK: - Private
private extension MenuViewController {
    func setupSelf() {
        title = Constants.menuViewTitle
    }

    func setupViews() {
        view.backgroundColor = .white

        view.addSubview(galleryCityButton)
        view.addSubview(galleryCatsButton)
    }

    func setupActions() {
        galleryCityButton.addTarget(self, action: #selector(galleryCityButtonTouchedSender), for: .touchUpInside)
        galleryCatsButton.addTarget(self, action: #selector(galleryCatsButtonTouchedSender), for: .touchUpInside)
    }

    func setupLayouts() {
        galleryCityButton.translatesAutoresizingMaskIntoConstraints = false
        galleryCatsButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            galleryCityButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            galleryCityButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -20),
            galleryCityButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1 / 2)
        ])

        NSLayoutConstraint.activate([
            galleryCatsButton.topAnchor.constraint(equalTo: galleryCityButton.bottomAnchor, constant: 20),
            galleryCatsButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            galleryCatsButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1 / 2)
        ])
    }
}

// MARK: - Actions
private extension MenuViewController {
    @objc func galleryCityButtonTouchedSender(sender: UIButton) {
        output.presentGalleryView(urlStrings: GlobalConstants.сityImagesUrlStings, title: Constants.catsTitle)
    }

    @objc func galleryCatsButtonTouchedSender(sender: UIButton) {
        output.presentGalleryView(urlStrings: GlobalConstants.сatsImagesUrlStings, title: Constants.catsTitle)
    }
}
