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
    private var galleryCityButton = MenuButton(title: Constants.cityTitle, color: Constants.cityButtonColor)
    private var galleryCatsButton = MenuButton(title: Constants.catsTitle, color: Constants.catsButtonColor)

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.menuViewTitle
        setupViews()
        setupButtons()
        setupLayouts()
    }
}

// MARK: - Private
private extension MenuViewController {
    @objc func goToCityGalleryView(sender: UIButton) {
        let viewController = GalleryViewController(
            galleryItemsList: GalleryItem.imagesCityUrls,
            title: Constants.cityTitle)
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc func goToCatsGalleryView(sender: UIButton) {
        let viewController = GalleryViewController(
            galleryItemsList: GalleryItem.imagesCatsUrls,
            title: Constants.catsTitle)
        navigationController?.pushViewController(viewController, animated: true)
    }

    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(galleryCityButton)
        view.addSubview(galleryCatsButton)
    }

    func setupButtons() {
        galleryCityButton.addTarget(self, action: #selector(goToCityGalleryView), for: .touchUpInside)
        galleryCatsButton.addTarget(self, action: #selector(goToCatsGalleryView), for: .touchUpInside)
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
