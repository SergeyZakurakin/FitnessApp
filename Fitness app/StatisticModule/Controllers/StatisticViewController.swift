//
//  StatisticViewController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/7/24.
//

import UIKit

// 1. create label Statistic 100 point to table view
// 2. create label exercises
// 3. custom table view
// 4 separator hight 1

class StatisticViewController: UIViewController {
    
    //MARK: - UI
    private let statisticLabel: UILabel = {
        let element = UILabel()
        element.text = "STATISTIC"
        element.font = .robotoBold24()
        element.textColor = .specialGray
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let element = UISegmentedControl(items: ["Week", "Month"])
        element.selectedSegmentIndex = 0
        element.backgroundColor = .specialGreen
        element.selectedSegmentTintColor = .specialYellow
        let font = UIFont(name: "Roboto-Medium", size: 16)
        element.setTitleTextAttributes([.font : font as Any, .foregroundColor: UIColor.white], for: .normal)
        element.setTitleTextAttributes([.font : font as Any, .foregroundColor: UIColor.specialGray], for: .selected)
        element.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let exercisesLabel = UILabel(text: "exercises")
    
    private let statisticTableView = StatisticTableView()
    
    private var workoutArray: [WorkOutModel] = []
    
    private var differenceArray: [DifferenceWorkout] = []
    
    
    //MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setStartScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
    }
    
    @objc private func segmentedChange() {
        let dateToday = Date()
        differenceArray = [DifferenceWorkout]()
        
        
        if segmentedControl.selectedSegmentIndex == 0 {
            let dayStart = dateToday.offsetDay(day: 7)
            getDifferenceModel(dateStart: dayStart)
        } else {
            let dayStart = dateToday.offsetMonth(month: 1)
            getDifferenceModel(dateStart: dayStart)
        }
    }
    
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(statisticLabel)
        view.addSubview(exercisesLabel)
        view.addSubview(statisticTableView)
        view.addSubview(segmentedControl)
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
    
    private func getDifferenceModel(dateStart: Date) {
        let dateEnd = Date()
        let nameArray = getWorkoutsName()
        let allWorkouts = RealmManager.shared.getResultWorkoutModel()
        
        for name in nameArray {
            let predicateDifference = NSPredicate(format: "workOutName = '\(name)' AND workOutDate BETWEEN %@", [dateStart, dateEnd])
            let filteredArray = allWorkouts.filter(predicateDifference).sorted(byKeyPath: "workOutDate")
            workoutArray = filteredArray.map { $0 }
            
            guard let last = workoutArray.last?.workOutReps else { return }
            guard let first = workoutArray.first?.workOutReps else { return }
            
            
            let differenceWorkout = DifferenceWorkout(name: name, lastReps: last, firstReps: first)
            differenceArray.append(differenceWorkout)
        }
        statisticTableView.setDifferenceArray(array: differenceArray)
    }
    
    private func setStartScreen() {
        let dateToday = Date()
        differenceArray = [DifferenceWorkout]()
        getDifferenceModel(dateStart: dateToday.offsetDay(day: 7))
        statisticTableView.reloadData()
    }
    
}


//MARK: - Setup Constraints
extension StatisticViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            statisticLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statisticLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            segmentedControl.topAnchor.constraint(equalTo: statisticLabel.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            
            exercisesLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            statisticTableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor),
            statisticTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statisticTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statisticTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        
        
        ])
    }
}
