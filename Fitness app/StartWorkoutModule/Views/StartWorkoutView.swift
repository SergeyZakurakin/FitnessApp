//
//  StartWorkoutView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/10/24.
//

import UIKit

final class StartWorkoutView: UIView {
    //MARK: - setup UI
    
    private let workoutBackground: UIView = {
        let element = UIView()
        element.backgroundColor = .specialBrown
        element.layer.cornerRadius = 10
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(workoutBackground)
        
        
    }
    
}
//MARK: - Setup Constraints
extension StartWorkoutView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            workoutBackground.topAnchor.constraint(equalTo: topAnchor),
            workoutBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            workoutBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            workoutBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            workoutBackground.heightAnchor.constraint(equalToConstant: 280),
        
        
        ])
        
        
        
    }
    
    
    
}
