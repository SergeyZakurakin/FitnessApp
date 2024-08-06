//
//  WeatherView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/5/24.
//

import UIKit

final class WeatherView: UIView {
    
    //MARK: - Setup UI
    private let titleLabel: UILabel = {
        let element = UILabel()
        element.text = "Sunny"
        element.textColor = .black
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let descriptionLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 0
        element.text = "Perfect weather for outside training"
        element.textColor = .black
        element.font = .systemFont(ofSize: 12)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let weatherImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "sun")
        
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
    
    //MARK: - Setup Views
    private func setupViews() {
        backgroundColor = .white
        self.layer.cornerRadius = 10
        
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(weatherImageView)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

//MARK: - Setup Constraints
extension WeatherView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 200),
            
            weatherImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            weatherImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])

        
        
    }
    
    
}
