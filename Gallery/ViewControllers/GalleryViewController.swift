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

        static let spacing = 10.0
        static let highlightedItemOpacity: Float = 0.9
        static let cellBackgroundColor = UIColor.gray

        static let refreshDuration = 1.0
        static let сellAnimationDuration = 1.0
    }

    // MARK: - Properties
    private let galleryImagesInitialState: [GalleryItem]
    private lazy var galleryImagesCurrentState: [GalleryItem] = galleryImagesInitialState
    private let pageTitle: String

    private let refresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        return refresh
    }()
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.alwaysBounceVertical = true
        return collectionView
    }()

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pageTitle
        setupViews()
        setupLayouts()
    }

    convenience init() {
        self.init(galleryItemsList: [], title: "")
    }

    init(galleryItemsList: [GalleryItem], title: String) {
        self.galleryImagesInitialState = galleryItemsList
        self.pageTitle = title

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
        coordinator.animate { _ in
            self.collectionView.collectionViewLayout.invalidateLayout()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        galleryImagesCurrentState.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as! GalleryCell
        cell.contentView.backgroundColor = Constants.cellBackgroundColor
        cell.setGalleryItem(galleryItem: galleryImagesCurrentState[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let collectionViewCell = collectionView.cellForItem(at: indexPath) as? GalleryCell else {
            return
        }
        UIView.animate(withDuration: Constants.сellAnimationDuration, delay: 0) {
            collectionViewCell.frame.origin.x += collectionViewCell.frame.width + Constants.spacing
            collectionViewCell.layer.opacity = 0
        }

        collectionView.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.сellAnimationDuration) {
            self.galleryImagesCurrentState.remove(at: indexPath.row)
            self.collectionView.deleteItems(at: [indexPath])
            self.collectionView.isUserInteractionEnabled = true
        }
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.layer.opacity = Constants.highlightedItemOpacity
        }
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.layer.opacity = 1
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 2 * Constants.spacing

        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: Constants.spacing, left: Constants.spacing, bottom: Constants.spacing, right: Constants.spacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { Constants.spacing }
}

// MARK: - Private
private extension GalleryViewController {
    @objc func handleRefresh(sender: UIRefreshControl) {
        galleryImagesCurrentState = galleryImagesInitialState
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.refreshDuration) {
            let indexSet = IndexSet(integer: 0)
            self.collectionView.reloadSections(indexSet)
            self.refresh.endRefreshing()
        }
    }

    func setupViews() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: Constants.cellIdentifier)

        refresh.addTarget(self, action: #selector(handleRefresh), for: .allEvents)
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
