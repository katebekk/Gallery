//
//  GalleryViewController.swift
//  Gallery
//
//  Created by Kate Bekkerman on 17/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import UIKit

final class GalleryViewController: UIViewController {
    private enum Constants {
        static let cellIdentifier = "Cell"

        static let indexSet = IndexSet(integer: 0)
    }

    // MARK: - Properties
    var collectionViewManager: GalleryCollectionViewManager!
    var output: GalleryViewOutput!

    private var cellModels: [GalleryCellModel]!
    private var pageTitle: String!

    private let refresh = UIRefreshControl()

    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.alwaysBounceVertical = true

        return collectionView
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
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

extension GalleryViewController: GalleryViewInput {
    func configureView() {
        setupViews()
        setupActions()
        setupCollectionView()
        setupLayouts()
    }

    func configure(with cellModels: [GalleryCellModel], title: String) {
        pageTitle = title
        self.cellModels = cellModels
    }

    func reload(with cellModels: [GalleryCellModel]) {
        collectionViewManager.reload(with: cellModels)
        collectionView.reloadSections(Constants.indexSet)
    }

    func endRefreshing() {
        refresh.endRefreshing()
    }
}

// MARK: - Private
private extension GalleryViewController {
    func setupViews() {
        title = pageTitle
        view.addSubview(collectionView)
    }

    func setupActions() {
        refresh.addTarget(self, action: #selector(handleRefresh), for: .allEvents)
    }

    func setupCollectionView() {
        collectionViewManager.reload(with: cellModels)

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
        output.onRefreshControlPull(with: cellModels)
    }
}
