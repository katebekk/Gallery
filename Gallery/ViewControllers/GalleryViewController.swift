//
//  SecondViewController.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 08.02.2022.
//

import UIKit

enum Section {
    case main
}

class GalleryViewController: UIViewController {
    // MARK: - Properties
    private let galleryImages: [GalleryItem]
    private let pageTitle: String
    private let cellIdentifier = "Cell"
    private let spacing: CGFloat = 10.0
    private lazy var dataSource = makeDataSource()
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.alwaysBounceVertical = true
        
        return collectionView
    }()
    
    private let refresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(handelRefresh), for: .allEvents)
        return refresh
    }()
    
    @objc private func handelRefresh(sender: UIRefreshControl){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                self.applySnapshot()
                self.refresh.endRefreshing()
        }
    }
    
    // MARK: - Value Types
    typealias DataSource = UICollectionViewDiffableDataSource<Section, GalleryItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, GalleryItem>
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pageTitle
        setupViews()
        setupLayouts()
        applySnapshot()
    }
    
    convenience init() {
        self.init(galleryItemsList: [], title: "")
    }
    
    init(galleryItemsList:[GalleryItem], title: String)
    {
        self.galleryImages = galleryItemsList
        self.pageTitle = title
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func setupViews() {
        view.addSubview(collectionView)
        collectionView.refreshControl = refresh
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { context in
            self.collectionView.collectionViewLayout.invalidateLayout()
        })
    }
    
    // MARK: - DataSource Functions
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider:
                { (collectionView, indexPath, galleryItemHashable) -> UICollectionViewCell? in
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: self.cellIdentifier,
                        for: indexPath) as? GalleryCell
                    cell?.galleryItem = galleryItemHashable
                    return cell
                })
        
        return dataSource
    }
    
    private func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(galleryImages)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}


// MARK: - UICollectionViewDelegate
extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let collectionViewCell = collectionView.cellForItem(at: indexPath) else {
            return
        }
        
        UIView.animate(withDuration:  1, delay: 0,
                       options: .curveEaseInOut,
                       animations: {
            collectionViewCell.frame.origin.x += collectionViewCell.frame.width + self.spacing
            collectionViewCell.layer.opacity = 0
        })

        removeItem(indexPath)
    }
    
    private func removeItem(_ indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        
        var newSnapshot = dataSource.snapshot()
        newSnapshot.deleteItems([item])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
           self.dataSource.apply(newSnapshot, animatingDifferences: true)
        }
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width - 2 * spacing
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }

}
