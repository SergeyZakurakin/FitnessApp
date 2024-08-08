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
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    @objc private func segmentedChange() {
        if segmentedControl.selectedSegmentIndex == 0 {
            print("Week")
        } else {
            print("Month")
        }
    }
    
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(statisticLabel)
        view.addSubview(exercisesLabel)
        view.addSubview(statisticTableView)
        view.addSubview(segmentedControl)
    }
}

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
