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
        element.numberOfLines = 0
        element.adjustsFontSizeToFitWidth = true
        element.font = .robotoMedium24()
        element.textColor = .specialGray
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var addWorkoutButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = .specialYellow
        element.tintColor = .specialDarkGreen
        element.titleLabel?.font = .robotoMedium12()
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
        element.addShadowOnView()
        
        element.layer.cornerRadius = 10
        element.setTitle("Add workout", for: .normal)
        element.setImage(UIImage(named: "plus"), for: .normal)
        element.addTarget(self, action: #selector(addWorkoutButtonPressed), for: .touchUpInside)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    // зеленое вю на главный экран
    private let calendar = CalendarView()
    // белое вю с солнышком
    private let weatherView = WeatherView()
    // созданый лейбл в Extension
    private let workoutTodayLabel = UILabel(text: "Workout today")
    
    private let workoutTableView = MainTableView()
    

    //MARK: - Life Cycle
    override func viewDidLayoutSubviews() {
        // лого аватар (радиус делим на размер чтоб было круглое)
        userImageImageView.layer.cornerRadius = userImageImageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }

    //MARK: - Setup Views
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(calendar)
        view.addSubview(userImageImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(weatherView)
        view.addSubview(workoutTodayLabel)
        view.addSubview(workoutTableView)
        
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
            weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
            weatherView.heightAnchor.constraint(equalToConstant: 80),
            
            workoutTodayLabel.topAnchor.constraint(equalTo: addWorkoutButton.bottomAnchor, constant: 10),
            workoutTodayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            workoutTableView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor),
            workoutTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            workoutTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            workoutTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        
        
    }
  
}
