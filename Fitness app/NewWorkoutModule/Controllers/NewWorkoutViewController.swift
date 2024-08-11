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
    
    private let newWorkoutLabel = UILabel(
        text: "NEW WORKOUT",
        font: .robotoBold24(),
        textColor: .specialGray
    )
    
    private lazy var closeButton = CloseButton(type: .system)
    
    private let nameView = NameView()
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
    private lazy var saveButton = UIButton(text: "SAVE")
    
    private var workOutModel = WorkOutModel()
    
    private let testImage = UIImage(named: "imageCell") // change image name
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        
    }
    
    @objc private func closeButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtonPressed() {
        setModel()
        print(workOutModel)
        RealmManager.shared.saveWorkoutModel(workOutModel)
    }

    private func setModel() {
        workOutModel.workOutName = nameView.getNameFromTextField()
        
        workOutModel.workOutDate = dateAndRepeatView.getDateAndRepeat().date
        workOutModel.workOutRepeat = dateAndRepeatView.getDateAndRepeat().isRepeat
        workOutModel.workOutNumberOfDay = dateAndRepeatView.getDateAndRepeat().date.getWeekDayNumber()
        
        workOutModel.workOutSets = repsOrTimerView.sets
        workOutModel.workOutReps = repsOrTimerView.reps
        workOutModel.workOutTimer = repsOrTimerView.timer
        
        // image to Data
        guard let imageData = testImage?.pngData() else { return }
        workOutModel.workOutImage = imageData
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
            saveButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
}
