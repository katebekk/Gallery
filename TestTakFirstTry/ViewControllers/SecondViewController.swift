//
//  SecondViewController.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 08.02.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    let imagesStartState = ["image1.jpeg", "image2.jpeg", "image3.jpeg", "image4.jpeg",
                    "image5.jpeg", "image6.jpeg", "image7.jpeg"]
    var carrentImages = ["image1.jpeg", "image2.jpeg", "image3.jpeg", "image4.jpeg",
                        "image5.jpeg", "image6.jpeg", "image7.jpeg"]
    
    private let cellIdentifier = "Cell"
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.alwaysBounceVertical = true
        return collectionView
    }()
    
    private let refresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(handelRefresh), for: .valueChanged)
        refresh.tintColor = UIColor.blue
        return refresh
    }()
    
    @objc func handelRefresh(){
        carrentImages = imagesStartState
        collectionView.reloadData()
        
        refresh.endRefreshing()
    }
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 10.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.addSubview(refresh)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }

    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        // Layout constraints for `collectionView`
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.carrentImages.remove(at: indexPath.row)
        self.collectionView.deleteItems(at: [indexPath])
        print("Subclassed Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carrentImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! GalleryCell
        let image = carrentImages[indexPath.row]
        cell.setup(with: image)
        cell.contentView.backgroundColor = .gray
        print("Creating cell \(indexPath)")
        return cell
    }
}

extension SecondViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = view.frame.width - 2 * LayoutConstant.spacing
        
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
}
