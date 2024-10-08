//
//  StatisticTableViewCell.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/7/24.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {
    
    static let idTableViewCell = "idTableViewCell"
    
    //MARK: - UI
    private let workoutLabel: UILabel = {
        let element = UILabel()
        element.text = "Biceps"
        element.textColor = .specialGray
        element.font = .robotoBold24()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let differenceLabel: UILabel = {
        let element = UILabel()
        element.text = "+2"
        element.textColor = .specialGreen
        element.font = .robotoBold24()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let seporatorView = SeparatorView()
    
    
    private let beforeLabel = UILabel(text: "Before: 18")
    private let nowLabel = UILabel(text: "Now: 20")
    
    private var labelStackView = UIStackView()
    
    
    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setup Views
    private func setupViews() {
        
        backgroundColor = .clear
        selectionStyle = .none
        
        
        addSubview(workoutLabel)
        addSubview(differenceLabel)
        addSubview(seporatorView)
        
        labelStackView = UIStackView(
            arrangedSubviews: [beforeLabel, nowLabel],
            axis: .horizontal,
            spacing: 10
        )
        addSubview(labelStackView)
    }
    
    //MARK: - Public Methods
    public func configure(differenceWorkout: DifferenceWorkout) {
        workoutLabel.text = differenceWorkout.name
        beforeLabel.text = "Before: \(differenceWorkout.firstReps)"
        nowLabel.text = "Now: \(differenceWorkout.lastReps)"
        
        let difference = differenceWorkout.lastReps - differenceWorkout.firstReps
        differenceLabel.text = "\(difference)"
        
        switch difference {
        case ..<0: differenceLabel.textColor = .specialGreen
        case 1...: differenceLabel.textColor = .blue
        default:
            differenceLabel.textColor = .specialGray
        }
        
    }
}
//MARK: - Setup Constraints
extension StatisticTableViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            workoutLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            workoutLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            labelStackView.topAnchor.constraint(equalTo: workoutLabel.bottomAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            seporatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            seporatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            seporatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            seporatorView.heightAnchor.constraint(equalToConstant: 1),
            
            differenceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            differenceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
