//
//  ProfileViewController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/23/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - UI
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
        element.contentMode = .scaleAspectFill
        element.clipsToBounds = true
//        element.contentMode = .center
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let profileNameLabel: UILabel = {
       let element = UILabel()
        element.text = "SERGEY ZAKURAKIN"
        element.textColor = .white
        element.font = .robotoBold24()
        element.textAlignment = .center
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private var heightWeightStackView = UIStackView()
    private let heightLabel = UILabel(text: "Height: 178")
    private let weightLabel = UILabel(text: "weight: 77")
    
    private var heightWeightEditingStackView = UIStackView()
    
    private lazy var editingButton: UIButton = {
        let element = UIButton(type: .system)
        element.semanticContentAttribute = .forceRightToLeft
        element.setTitle("editing ", for: .normal)
        
        element.setImage(UIImage(named: "MoreCircle"), for: .normal)
        element.tintColor = .specialGreen
        
//        element.addTarget(self, action: #selector(editingButtonPressed), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let profileCollectionView = ProfileCollectionView()
    
    private let targetLabel = UILabel(text: "Target: 30 Workouts")
    
    private var minMaxNumberStackView = UIStackView()
    private let minNumberLabel = UILabel(text: "2", font: .robotoBold24(), textColor: .specialBlack)
    private let maxNumberLabel = UILabel(text: "20", font: .robotoBold24(), textColor: .specialBlack)
    
    private let numberProgressView: UIProgressView = {
       let element = UIProgressView()
        element.setProgress(0.0, animated: true)
        element.trackTintColor = .specialLightBrown
        element.progressTintColor = .specialGreen
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    var resultWorkout: [ResultWorkout] = []
    
    private var currentProgress: Float = 0.0
    

    //MARK: - Life Cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        resultWorkout = [ResultWorkout]()
        getWorkoutsResults()
        profileCollectionView.setResultsWorkoutArray(array: resultWorkout)
        profileCollectionView.reloadData()
        setupUserParameters()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .specialBackground
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(profileLabel)
        view.addSubview(greenBackgroundView)
        view.addSubview(userImageView)
        greenBackgroundView.addSubview(profileNameLabel)
        
        heightWeightStackView = UIStackView(
            arrangedSubviews: [heightLabel, weightLabel],
            axis: .horizontal,
            spacing: 10
        )
        heightWeightEditingStackView = UIStackView(
            arrangedSubviews: [heightWeightStackView, editingButton],
            axis: .horizontal,
            spacing: 10
        )
        editingButton.addTarget(self, action: #selector(editingButtonPressed), for: .touchUpInside)
        
        view.addSubview(heightWeightEditingStackView)
        view.addSubview(profileCollectionView)
        view.addSubview(targetLabel)
        
        minMaxNumberStackView = UIStackView(
            arrangedSubviews: [minNumberLabel, maxNumberLabel],
            axis: .horizontal,
            spacing: 10
        )
        
        view.addSubview(minMaxNumberStackView)
        view.addSubview(numberProgressView)
        
        profileCollectionView.profileDelegate = self
    }
    
    @objc private func editingButtonPressed() {
        let settingsVC = SettingsViewController()
        settingsVC.modalPresentationStyle = .fullScreen
        present(settingsVC, animated: true)
    }
    
    private func getWorkoutsName() -> [String] {
        var nameArray: [String] = []
        let allWorkouts = RealmManager.shared.getResultWorkoutModel()
        
        for workoutModel in allWorkouts {
            if !nameArray.contains(workoutModel.workOutName) {
                nameArray.append(workoutModel.workOutName)
            }
        }
        return nameArray
    }
    
    private func getWorkoutsResults() {
        let nameArray = getWorkoutsName()
        let workoutArray = RealmManager.shared.getResultWorkoutModel()
        
        for name in nameArray {
            let predicate = NSPredicate(format: "workOutName = '\(name)'")
            let filteredArray = workoutArray.filter(predicate).sorted(byKeyPath: "workOutName")
            var result = 0
            var image: Data?
            filteredArray.forEach { model in
                result += model.workOutReps * model.workOutSets
                image = model.workOutImage
            }
            let resultsModel = ResultWorkout(name: name, result: result, imageData: image)
            resultWorkout.append(resultsModel)
        }
    }
    
    private func setupUserParameters() {
        
        let userArray = RealmManager.shared.getResultUserModel()
        
        if userArray.count != 0 {
            profileNameLabel.text = userArray[0].userFirstName + " " + userArray[0].userSecondName
            heightLabel.text = "Height: \(userArray[0].userHeight)"
            weightLabel.text = "Weight: \(userArray[0].userWeight)"
            targetLabel.text = "TARGET: \(userArray[0].userTarget)"
            maxNumberLabel.text = "\(userArray[0].userTarget)"
            
            guard let data = userArray[0].userImage,
                  let image = UIImage(data: data) else { return }
            userImageView.image = image
            
        }
    }
    
}

extension ProfileViewController: ProfileCollectionViewDelegate {
    func didSelectItem(increment: Float) {
        if currentProgress < 1.0 {
            currentProgress += increment
            numberProgressView.setProgress(currentProgress, animated: true)
        }
    }
}

//MARK: - Setup Constraints
extension ProfileViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            userImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImageView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 20),
            userImageView.heightAnchor.constraint(equalToConstant: 100),
            userImageView.widthAnchor.constraint(equalToConstant: 100),
            
            greenBackgroundView.topAnchor.constraint(equalTo: userImageView.centerYAnchor),
            greenBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            greenBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            greenBackgroundView.heightAnchor.constraint(equalToConstant: 100),
            
            profileNameLabel.centerXAnchor.constraint(equalTo: greenBackgroundView.centerXAnchor),
            profileNameLabel.bottomAnchor.constraint(equalTo: greenBackgroundView.bottomAnchor, constant: -10),
            profileNameLabel.leadingAnchor.constraint(equalTo: greenBackgroundView.leadingAnchor, constant: 20),
            profileNameLabel.trailingAnchor.constraint(equalTo: greenBackgroundView.trailingAnchor, constant: -20),
            
            heightWeightEditingStackView.topAnchor.constraint(equalTo: greenBackgroundView.bottomAnchor, constant: 10),
            heightWeightEditingStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            heightWeightEditingStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            profileCollectionView.topAnchor.constraint(equalTo: heightWeightEditingStackView.bottomAnchor, constant: 10),
            profileCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            profileCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            profileCollectionView.heightAnchor.constraint(equalToConstant: 220),
            
            targetLabel.topAnchor.constraint(equalTo: profileCollectionView.bottomAnchor, constant: 20),
            targetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            targetLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            minMaxNumberStackView.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 20),
            minMaxNumberStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            minMaxNumberStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            numberProgressView.topAnchor.constraint(equalTo: minMaxNumberStackView.bottomAnchor, constant: 10),
            numberProgressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            numberProgressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            numberProgressView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

