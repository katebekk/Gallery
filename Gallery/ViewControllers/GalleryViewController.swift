//
//  SecondViewController.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 08.02.2022.
//

import UIKit

final class GalleryViewController: UIViewController {
    private enum Constants {
        static let cellIdentifier = "Cell"

        static let refreshDuration = 1.0
        static let сellAnimationDuration = 1.0
    }

    // MARK: - Properties
    private let galleryItems: [GalleryItem]
    private let pageTitle: String

    private let refresh = UIRefreshControl()
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.alwaysBounceVertical = true

        return collectionView
    }()

    private let collectionViewManager: GalleryCollectionViewManager

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSelf()
        setupViews()
        setupActions()
        setupCollectionView()
        setupLayouts()
    }

    init(galleryItems: [GalleryItem], title: String) {
        self.galleryItems = galleryItems
        pageTitle = title

        collectionViewManager = GalleryCollectionViewManager(collectionView: collectionView)
        collectionViewManager.configure(items: galleryItems)

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate { [weak self] _ in
            self?.collectionView.collectionViewLayout.invalidateLayout()
        }
    }
}

// MARK: - Private
private extension GalleryViewController {
    func setupSelf() {
        title = pageTitle
    }

    func setupViews() {
        view.addSubview(collectionView)
    }

    func setupActions() {
        refresh.addTarget(self, action: #selector(handleRefresh), for: .allEvents)
    }

    func setupCollectionView() {
        collectionView.dataSource = collectionViewManager.collectionViewModel
        collectionView.delegate = collectionViewManager
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: Constants.cellIdentifier)

        collectionView.refreshControl = refresh
    }

    func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: - Actions
private extension GalleryViewController {
    @objc func handleRefresh(sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.refreshDuration) { [weak self] in
            guard let self = self else { return }

            let indexSet = IndexSet(integer: 0)
            self.collectionViewManager.updateCollectionViewModelWithArray(items: self.galleryItems)
            self.collectionView.reloadSections(indexSet)
            self.refresh.endRefreshing()
        }
    }
}
