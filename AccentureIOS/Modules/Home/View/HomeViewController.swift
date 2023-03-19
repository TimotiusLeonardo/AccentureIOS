//
//  ViewController.swift
//  AccentureIOS
//
//  Created by Timotius Leonardo Lianoto on 19/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: View Component
    lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = .init(width: view.frame.size.width/1.2,
                                height: 80)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCollectionViewCell.self,
                                forCellWithReuseIdentifier: "Cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var viewModel: HomeViewModel = {
        let viewModel = HomeViewModel(reloadDataSource: { [weak self] in
            self?.collectionView.reloadData()
        })
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initViews()
    }
    
    private func initViews() {
        // Add collection view to superview
        view.addSubview(collectionView)
        let collectionViewContraints = [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(collectionViewContraints)
        
        viewModel.getData()
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.postDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewListCell(frame: .zero)
        }
        cell.subtitleView.text = viewModel.postDatas[indexPath.row].body
        cell.titleView.text = viewModel.postDatas[indexPath.row].title
        return cell
    }
}

