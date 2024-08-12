//
//  StartViewController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/10/24.
//

import UIKit

final class StartViewController: UIViewController {
    
    
    //MARK: - UI
    private let startWorkoutLabel = UILabel(
        text: "START WORKOUT",
        font: .robotoBold24(),
        textColor: .specialGray
    )
    
    private lazy var closeButton = CloseButton(type: .system)
    
    private let workoutImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Frame1")
        element.contentMode = .scaleAspectFit
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let detailsLabel = UILabel(text: "Details")
    
    private let startWorkoutView = StartWorkoutView()
    
    private lazy var finishButton = UIButton(text: "FINISH")
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Private Methods
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(workoutImageView)
        view.addSubview(detailsLabel)
        view.addSubview(startWorkoutView)
        view.addSubview(finishButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        finishButton.addTarget(self, action: #selector(finishButtonPressed), for: .touchUpInside)
    }
    //MARK: - Actions
    @objc private func closeButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc private func finishButtonPressed() {
        print("finish")
    }
}

extension StartViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            workoutImageView.centerXAnchor.constraint(equalTo: startWorkoutLabel.centerXAnchor),
            workoutImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 20),
            
            detailsLabel.topAnchor.constraint(equalTo: workoutImageView.bottomAnchor, constant: 15),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            startWorkoutView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor),
            startWorkoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            startWorkoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            finishButton.topAnchor.constraint(equalTo: startWorkoutView.bottomAnchor, constant: 10),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            finishButton.heightAnchor.constraint(equalToConstant: 60)

            
        
        
        
        ])
        
        
    }
    
    
    
    
}
