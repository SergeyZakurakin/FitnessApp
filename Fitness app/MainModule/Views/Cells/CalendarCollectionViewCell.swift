//
//  CalendarCollectionViewCell.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/7/24.
//

import UIKit
//setup cell
class CalendarCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Setup UI
    private let dayOfWeekLabel: UILabel = {
        let element = UILabel()
        element.text = "We"
        element.font = .robotoBold16()
        element.textColor = .white
        element.textAlignment = .center

        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let numberOfDayLabel: UILabel = {
        let element = UILabel()
        element.text = "22"
        element.font = .robotoBold20()
        element.textColor = .white
        element.textAlignment = .center

        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // isSelected default method, showing what to do when cell is selected
    override var isSelected: Bool {
        didSet {
            if isSelected == true {
                backgroundColor = .specialYellow
                dayOfWeekLabel.textColor = .specialBlack
                numberOfDayLabel.textColor = .specialDarkGreen
            } else {
                backgroundColor = .specialGreen
                dayOfWeekLabel.textColor = .white
                numberOfDayLabel.textColor = .white
            }
        }
    }
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.layer.cornerRadius = 10
        
        addSubview(dayOfWeekLabel)
        addSubview(numberOfDayLabel)
    }    
    //MARK: - Public Methods
    public func dateForCell(numberOfDay: String, dayOfWeek: String) {
        dayOfWeekLabel.text = dayOfWeek
        numberOfDayLabel.text = numberOfDay
    }
}

//MARK: - Setup Constraints
extension CalendarCollectionViewCell {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            numberOfDayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberOfDayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}
