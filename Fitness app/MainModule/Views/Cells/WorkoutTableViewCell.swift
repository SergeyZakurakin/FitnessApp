//
//  WorkoutTableViewCell.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/7/24.
//

import UIKit


final class WorkoutTableViewCell: UITableViewCell {
    
    static let idTableViewCell = "idTableViewCell"
    
    private let backgroundCellView: UIView = {
        let element = UIView()
        element.layer.cornerRadius = 20
        element.backgroundColor = .specialBrown
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let workoutBackgroundView: UIView = {
        let element = UIView()
        element.layer.cornerRadius = 20
        element.backgroundColor = .specialBackground
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let workoutImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: "imageCell")?.withRenderingMode(.alwaysTemplate)
        element.tintColor = .black
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let workoutNameLabel: UILabel = {
        let element = UILabel()
        element.textColor = .specialBlack
        element.font = .robotoMedium22()
        element.text = "Pull Ups"
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let workoutRspsLabel: UILabel = {
        let element = UILabel()
        element.text = "Reps: 10"
        element.textColor = .specialGray
        element.font = .robotoMedium16()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let workoutSetsLabel: UILabel = {
        let element = UILabel()
        element.text = "Sets: 2"
        element.textColor = .specialGray
        element.font = .robotoMedium16()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var startButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = .specialYellow
        element.layer.cornerRadius = 10
        element.titleLabel?.font = .robotoBold16()
        element.setTitle("Start", for: .normal)
        element.addShadowOnView()
        element.tintColor = .specialDarkGreen
        element.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var labelsStackView = UIStackView()
    
    
    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(backgroundCellView)
        addSubview(workoutBackgroundView)
        addSubview(workoutImageView)
        addSubview(workoutNameLabel)
        
        labelsStackView = UIStackView(
            arrangedSubviews: [workoutRspsLabel, workoutSetsLabel],
            axis: .horizontal,
            spacing: 10
        )
        addSubview(labelsStackView)
        contentView.addSubview(startButton)
        
        
    }
    
    
    @objc private func startButtonPressed() {
        print("tableView cell tap")
    }
}

//MARK: - Setup Constraints
extension WorkoutTableViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            backgroundCellView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backgroundCellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            workoutBackgroundView.centerYAnchor.constraint(equalTo: backgroundCellView.centerYAnchor),
            workoutBackgroundView.leadingAnchor.constraint(equalTo: backgroundCellView.leadingAnchor, constant: 10),
            workoutBackgroundView.heightAnchor.constraint(equalToConstant: 70),
            workoutBackgroundView.widthAnchor.constraint(equalToConstant: 70),
            
            workoutImageView.topAnchor.constraint(equalTo: workoutBackgroundView.topAnchor, constant: 10),
            workoutImageView.bottomAnchor.constraint(equalTo: workoutBackgroundView.bottomAnchor, constant: -10),
            workoutImageView.leadingAnchor.constraint(equalTo: workoutBackgroundView.leadingAnchor, constant: 10),
            workoutImageView.trailingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: -10),
            
            workoutNameLabel.topAnchor.constraint(equalTo: backgroundCellView.topAnchor, constant: 10),
            workoutNameLabel.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            workoutNameLabel.trailingAnchor.constraint(equalTo: backgroundCellView.trailingAnchor, constant: -10),
            
            labelsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            labelsStackView.heightAnchor.constraint(equalToConstant: 20),
            
            startButton.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 5),
            startButton.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            startButton.trailingAnchor.constraint(equalTo: backgroundCellView.trailingAnchor, constant: -10),
            startButton.heightAnchor.constraint(equalToConstant: 30)

        ])
        
        
    }
}
