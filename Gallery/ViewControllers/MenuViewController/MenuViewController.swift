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
    private var router: MenuViewControllerRouter!
    private var galleryItemBuilder: GalleryItemBuilder

    private let galleryCityButton = MenuButton(title: Constants.cityTitle, color: Constants.cityButtonColor)
    private let galleryCatsButton = MenuButton(title: Constants.catsTitle, color: Constants.catsButtonColor)

    // MARK: - LifeCycle
    init() {
        galleryItemBuilder = GalleryItemBuilder()

        super.init(nibName: nil, bundle: nil)

        router = MenuViewControllerRouter(menuViewController: self)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
        let items = galleryItemBuilder.buildItemsArray(urlStrings: GlobalConstants.сityImagesUrlStings)
        router.presentGalleryView(items: items, title: Constants.cityTitle)
    }

    @objc func galleryCatsButtonTouchedSender(sender: UIButton) {
        let items = galleryItemBuilder.buildItemsArray(urlStrings: GlobalConstants.сatsImagesUrlStings)
        router.presentGalleryView(items: items, title: Constants.catsTitle)
    }
}
