//
//  SettingsViewController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/25/24.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let closeButton = CloseButton()
    
    private let profileLabel: UILabel = {
        let element = UILabel()
        element.text = "PROFILE"
        element.font = .robotoBold24()
        element.textColor = .specialGray
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    private let greenBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = .specialGreen
        element.layer.cornerRadius = 10
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let userImageView: UIImageView = {
        let element = UIImageView()
        element.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)  // #colorLiteral() (note)
        element.layer.borderColor = UIColor.white.cgColor
        element.layer.borderWidth = 5
        element.image = UIImage(named: "profileTabBar")?.withRenderingMode(.alwaysTemplate)
        element.tintColor = .white
        element.contentMode = .center
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainStackView = UIStackView()
    
    private lazy var firstNameStackView = UIStackView()
    private let firstNameLabel = UILabel(text: "First Name")
    private let firstNameTextfield = BrownTextField()
    
    private lazy var secondNameStackView = UIStackView()
    private let secondNameLabel = UILabel(text: "Second Name")
    private let secondNameTextfield = BrownTextField()
    
    private lazy var heightNameStackView = UIStackView()
    private let heightNameLabel = UILabel(text: "Height")
    private let heightNameTextfield = BrownTextField()
    
    private lazy var weightNameStackView = UIStackView()
    private let weightNameLabel = UILabel(text: "Weight")
    private let weightNameTextfield = BrownTextField()
    
    private lazy var targetNameStackView = UIStackView()
    private let targetNameLabel = UILabel(text: "Target")
    private let targetNameTextfield = BrownTextField()
    
    private lazy var saveButton = UIButton(text: "SAVE")
    
    //MARK: - Life Cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        
        view.addSubview(profileLabel)
        view.addSubview(greenBackgroundView)
        view.addSubview(userImageView)
        
        firstNameStackView = UIStackView(
            arrangedSubviews: [firstNameLabel, firstNameTextfield],
            axis: .vertical,
            spacing: 5
        )
        
        secondNameStackView = UIStackView(
            arrangedSubviews: [secondNameLabel, secondNameTextfield],
            axis: .vertical,
            spacing: 5
        )
        
        heightNameStackView = UIStackView(
            arrangedSubviews: [heightNameLabel, heightNameTextfield],
            axis: .vertical,
            spacing: 5
        )
        
        weightNameStackView = UIStackView(
            arrangedSubviews: [weightNameLabel, weightNameTextfield],
            axis: .vertical,
            spacing: 5
        )
        
        targetNameStackView = UIStackView(
            arrangedSubviews: [targetNameLabel, targetNameTextfield],
            axis: .vertical,
            spacing: 5
        )
        
        mainStackView = UIStackView(
            arrangedSubviews: [
                firstNameStackView,
                secondNameStackView,
                heightNameStackView,
                weightNameStackView,
                targetNameStackView
            ],
            axis: .vertical,
            spacing: 20
        )
        
        view.addSubview(mainStackView)
        view.addSubview(saveButton)
        
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    
    @objc private func closeButtonPressed() {
        dismiss(animated: true)
    }
    
    
    @objc private func saveButtonPressed() {
        print("save")
    }
    
}


//MARK: - Setup Constraints
extension SettingsViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            userImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImageView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 20),
            userImageView.heightAnchor.constraint(equalToConstant: 100),
            userImageView.widthAnchor.constraint(equalToConstant: 100),
            
            greenBackgroundView.topAnchor.constraint(equalTo: userImageView.centerYAnchor),
            greenBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            greenBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            greenBackgroundView.heightAnchor.constraint(equalToConstant: 70),
            
            mainStackView.topAnchor.constraint(equalTo: greenBackgroundView.bottomAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            saveButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 24),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            saveButton.heightAnchor.constraint(equalToConstant: 54)


        
        
        
        
        ])
    }
}
