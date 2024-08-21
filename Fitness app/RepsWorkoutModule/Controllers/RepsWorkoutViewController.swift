//
//  RepsWorkoutViewController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/10/24.
//

import UIKit

final class RepsWorkoutViewController: UIViewController {
    
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
    private let repsWorkoutView = RepsWorkoutView()
    private lazy var finishButton = UIButton(text: "FINISH")
    private var workoutModel = WorkOutModel()
    private let customAlert = CustomAlert()
    private var numberOfSet = 1
    
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
        view.addSubview(repsWorkoutView)
        repsWorkoutView.refreshLabels(model: workoutModel, numberOfSets: numberOfSet)
        repsWorkoutView.cellNextSetDelegate = self
        view.addSubview(finishButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        finishButton.addTarget(self, action: #selector(finishButtonPressed), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc private func closeButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc private func finishButtonPressed() {
        if numberOfSet == workoutModel.workOutSets {
            RealmManager.shared.updateStatusWorkoutModel(model: workoutModel)
            dismiss(animated: true)
        } else {
            presentAlertWithActions(
                title: "Warning",
                message: "You haven't finished your workout") {
                    self.dismiss(animated: true)
                }
        }
    }
    
    //MARK: - Public Methods
    public func setWorkoutModel(_ model: WorkOutModel) {
        workoutModel = model
    }
}

//MARK: - NextSetProtocol
extension RepsWorkoutViewController: NextSetProtocol {
    func nextSetTapped() {
        if numberOfSet < workoutModel.workOutSets {
            numberOfSet += 1
            repsWorkoutView.refreshLabels(model: workoutModel, numberOfSets: numberOfSet)
        } else {
            presentSimpleAlert(title: "Error", message: "Finish your workouts")
        }
    }
    
    func editingTapped() {
        customAlert.presentCustomAlert( viewController: self, repsOrTimer: "Reps") { [weak self] sets, reps in
            guard let self else { return }
            if sets != "" && reps != "" {
                guard let numberOfSets = Int(sets),
                      let numberOfReps = Int(reps) else { return }
                RealmManager.shared.updateSetsRepsWorkoutModel(
                    model: workoutModel,
                    sets: numberOfSets,
                    reps: numberOfReps
                )
                repsWorkoutView.refreshLabels(model: workoutModel, numberOfSets: numberOfSet)
            }
        }
    }
}

//MARK: - setup Constraints
extension RepsWorkoutViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            
            workoutImageView.centerXAnchor.constraint(equalTo: startWorkoutLabel.centerXAnchor),
            workoutImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 20),
            
            detailsLabel.topAnchor.constraint(equalTo: workoutImageView.bottomAnchor, constant: 15),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            repsWorkoutView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor),
            repsWorkoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            repsWorkoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            finishButton.topAnchor.constraint(equalTo: repsWorkoutView.bottomAnchor, constant: 10),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            finishButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
