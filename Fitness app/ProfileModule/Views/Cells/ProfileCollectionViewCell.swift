//
//  ProfileCollectionViewCell.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/24/24.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    
    private let mainLabel: UILabel = {
        let element = UILabel()
        element.text = "PUSH UPS"
        element.textColor = .white
        element.font = .robotoBold24()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let imageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "imageCell")?.withRenderingMode(.alwaysTemplate) // to change color
        element.tintColor = .white
        element.contentMode = .scaleAspectFit
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let numberLabel: UILabel = {
        let element = UILabel()
        element.text = "180"
        element.textColor = .white
        element.font = .robotoBold48()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraint()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
//        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        addSubview(mainLabel)
        addSubview(imageView)
        addSubview(numberLabel)
    }
    
}

extension ProfileCollectionViewCell {
    private func setupConstraint() {
        NSLayoutConstraint.activate([
        
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            imageView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 5),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            numberLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            numberLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
