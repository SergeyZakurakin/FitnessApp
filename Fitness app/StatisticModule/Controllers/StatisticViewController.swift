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
    
    private let exercisesLabel = UILabel(text: "exercises")
    
    private let statisticTableView = StatisticTableView()
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(statisticLabel)
        view.addSubview(exercisesLabel)
        view.addSubview(statisticTableView)
    }
}

extension StatisticViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            statisticLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statisticLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            exercisesLabel.topAnchor.constraint(equalTo: statisticLabel.bottomAnchor, constant: 100),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            statisticTableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor),
            statisticTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statisticTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statisticTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        
        
        ])
    }
}
