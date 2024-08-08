//
//  CalendarView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/5/24.
//

import UIKit

final class CalendarView: UIView {
    
    private let collectionView = CalendarCollectionView()
    
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Views
    private func setupViews() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        
    }
    
    
}
//MARK: - Setup Constraints
extension CalendarView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 110),

        
        
        ])
        
        
        
    }
}
