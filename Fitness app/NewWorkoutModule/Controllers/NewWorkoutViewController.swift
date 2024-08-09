//
//  NewWorkoutViewController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/8/24.
//

import UIKit
import RealmSwift

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
    
    private let nameView = NameView()
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
    private lazy var saveButton = UIButton(text: "SAVE")
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    
    @objc private func closeButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtonPressed() {
        print("Save")
    }

    
    //MARK: - Setup Views
    private func setupView() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(nameView)
        view.addSubview(dateAndRepeatView)
        view.addSubview(repsOrTimerView)
        view.addSubview(saveButton)
    }
}

//MARK: - Setup Constraints
extension NewWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            nameView.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            nameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            nameView.heightAnchor.constraint(equalToConstant: 60),
            
            dateAndRepeatView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 15),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            repsOrTimerView.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 15),
            repsOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            repsOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 15),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
