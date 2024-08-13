//
//  DateAndRepeatView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/8/24.
//

import UIKit

class DateAndRepeatView: UIView {
    
    //MARK: - UI
    
    private let dateAndRepeatLabel = UILabel(text: "Date and repeat")
    
    private let backgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = .specialBrown
        element.layer.cornerRadius = 10
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let dateLabel: UILabel = {
        let element = UILabel()
        element.text = "Date"
        element.font = .robotoBold16()
        element.textColor = .specialGray
        return element
    }()
    
    private let datePicker: UIDatePicker = {
        let element = UIDatePicker()
        element.datePickerMode = .date
        
        return element
    }()
    
    private let repeatLabel: UILabel = {
        let element = UILabel()
        element.text = "Repeat every day 7 times"
        element.font = .robotoBold16()
        element.textColor = .specialGray
        
        return element
    }()
    
    private let repeatSwitcher: UISwitch = {
        let element = UISwitch()
        element.isOn = true
        element.onTintColor = .specialGreen
        
        return element
    }()
    
    private var dateStackView = UIStackView()
    private var repeatsStackView = UIStackView()
    
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - Setup Views
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
//        backgroundColor = .clear
        
        addSubview(dateAndRepeatLabel)
        addSubview(backgroundView)
        
        dateStackView = UIStackView(
            arrangedSubviews: [dateLabel, datePicker],
            axis: .horizontal,
            spacing: 0
        )
        
        repeatsStackView = UIStackView(
            arrangedSubviews: [repeatLabel, repeatSwitcher],
            axis: .horizontal,
            spacing: 0
        )
        
        backgroundView.addSubview(dateStackView)
        backgroundView.addSubview(repeatsStackView)
    }
    
    //MARK: - Public Methods
    public func getDateAndRepeat() -> (date: Date, isRepeat: Bool) {
        return (datePicker.date, repeatSwitcher.isOn)
    }
    
    public func resetDataAndRepeat() {
        // correct date
        datePicker.date = Date()
        repeatSwitcher.isOn = true
    }
}



//MARK: - Setup Constraints
extension DateAndRepeatView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: topAnchor),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            dateAndRepeatLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            backgroundView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 5),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 100),
            
            dateStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            dateStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            dateStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            repeatsStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
            repeatsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            repeatsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
        ])
    }
}
