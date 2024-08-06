//
//  MainViewController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/5/24.
//

import UIKit

final class MainViewController: UIViewController {

    //MARK: - Setup UI
    private let userImageImageView: UIImageView = {
        let element = UIImageView()
        element.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)  // #colorLiteral()
        element.layer.borderColor = UIColor.white.cgColor
        element.layer.borderWidth = 5
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let userNameLabel: UILabel = {
        let element = UILabel()
        element.text = "Your name"
        element.textColor = .black
        element.numberOfLines = 0
        element.adjustsFontSizeToFitWidth = true
        element.font = .systemFont(ofSize: 30)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var addWorkoutButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8392156863, blue: 0.3568627451, alpha: 1)
        element.tintColor = #colorLiteral(red: 0.1411764706, green: 0.2941176471, blue: 0.262745098, alpha: 1)
        element.imageEdgeInsets = .init(
            top: 0,
            left: 20,
            bottom: 15,
            right: 0
        )
        element.titleEdgeInsets = .init(
            top: 50,
            left: -40,
            bottom: 0,
            right: 0
        )
        element.titleLabel?.font = .systemFont(ofSize: 12)
        element.layer.cornerRadius = 10
        element.setTitle("Add workout", for: .normal)
        element.setImage(UIImage(named: "plus"), for: .normal)
        element.addTarget(self, action: #selector(addWorkoutButtonPressed), for: .touchUpInside)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let calendar = CalendarView()
    
    private let weatherView = WeatherView()
    

    //MARK: - Life Cycle
    override func viewDidLayoutSubviews() {
        userImageImageView.layer.cornerRadius = userImageImageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }

    //MARK: - Setup Views
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9294117647, blue: 0.8862745098, alpha: 1)
        
        view.addSubview(calendar)
        view.addSubview(userImageImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(weatherView)
    }
    
    @objc private func addWorkoutButtonPressed() {
        print("TAP")
    }
}

//MARK: - Setup Constraints
extension MainViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            userImageImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userImageImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userImageImageView.heightAnchor.constraint(equalToConstant: 100),
            userImageImageView.widthAnchor.constraint(equalToConstant: 100),
            
            calendar.topAnchor.constraint(equalTo: userImageImageView.centerYAnchor),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendar.heightAnchor.constraint(equalToConstant: 70),
            
            userNameLabel.bottomAnchor.constraint(equalTo: calendar.topAnchor, constant: -10),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageImageView.trailingAnchor, constant: 5),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            addWorkoutButton.topAnchor.constraint(equalTo: calendar.bottomAnchor,constant: 10),
            addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
            
            weatherView.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 10),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherView.heightAnchor.constraint(equalToConstant: 80),
            weatherView.widthAnchor.constraint(equalToConstant: 280)
            
        ])
        
        
        
    }
  
}
