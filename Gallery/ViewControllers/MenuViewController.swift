//
//  ViewController.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 06.02.2022.
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
    private let galleryCityButton = MenuButton(title: Constants.cityTitle, color: Constants.cityButtonColor)
    private let galleryCatsButton = MenuButton(title: Constants.catsTitle, color: Constants.catsButtonColor)

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSelf()
        setupViews()
        setupButtons()
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

    func setupButtons() {
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
        let viewController = GalleryViewController(galleryItemsList: GalleryItem.imagesCityUrls,
                                                   title: Constants.cityTitle)
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc func galleryCatsButtonTouchedSender(sender: UIButton) {
        let viewController = GalleryViewController(galleryItemsList: GalleryItem.imagesCatsUrls,
                                                   title: Constants.catsTitle)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
