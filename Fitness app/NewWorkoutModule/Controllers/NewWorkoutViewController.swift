//
//  NewWorkoutViewController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/8/24.
//

import UIKit

final class NewWorkoutViewController: UIViewController {
    
    
    
    //MARK: - UI
    private let newWorkoutLabel: UILabel = {
        let element = UILabel()
        element.text = "NEW WORKOUT"
        element.font = .robotoBold24()
        element.textColor = .specialGray
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var closeButton: UIButton = {
        let element = UIButton(type: .system)
        element.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        element.setBackgroundImage(UIImage(named: "Close Button"), for: .normal)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupView()
        setConstraints()
        
    }
    
    @objc private func closeButtonPressed() {
        print("close")
    }
    
    private func setupView() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
    }
    
    
}

extension NewWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 20)

        
        
        
        ])
        
        
        
    }
}
