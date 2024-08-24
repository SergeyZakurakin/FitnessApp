//
//  ProfileCollectionView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/24/24.
//

import UIKit

class ProfileCollectionView: UICollectionView {
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        setupLayout()
        configure()
        delegates()
        
        register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.minimumLineSpacing = 20
    }
    
    private func configure() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func delegates() {
        dataSource = self
        delegate = self
    }
}

//MARK: - UICollectionViewDataSource
extension ProfileCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        70
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}

extension ProfileCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 176, height: 100)  //CGSize(width: 176, height: 100)

    }
}
