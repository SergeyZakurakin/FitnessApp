//
//  ProfileCollectionView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/24/24.
//

import UIKit

protocol ProfileCollectionViewDelegate: AnyObject {
    func didSelectItem(increment: Float)
}

class ProfileCollectionView: UICollectionView {
    
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    weak var profileDelegate: ProfileCollectionViewDelegate?
    
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
    
    private var resultWorkOut: [ResultWorkout] = []
    
    //MARK: - Public Methods
    public func setResultsWorkoutArray(array: [ResultWorkout]) {
        resultWorkOut = array
    }
}

//MARK: - UICollectionViewDataSource
extension ProfileCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        resultWorkOut.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
        
        let model = resultWorkOut[indexPath.item]
        cell.configure(model: model)
        
        
//        cell.backgroundColor = indexPath.item % 4 == 0 || indexPath.item % 4 == 3 ? .specialYellow : .specialGreen
        if indexPath.item % 4 == 0 || indexPath.item % 4 == 3 {
            cell.backgroundColor = .specialYellow
        } else {
            cell.backgroundColor = .specialGreen
        }
        
        
        
        return cell
    }
}

extension ProfileCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 176, height: 100)  //CGSize(width: 176, height: 100)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        profileDelegate?.didSelectItem(increment: 0.1)
        print(indexPath.item)
    }
}
