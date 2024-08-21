//
//  RepsOrTimerView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/8/24.
//

import UIKit

final class RepsOrTimerView: UIView {
    
    //MARK: - UI
    private let repsOrTimerLabel = UILabel(text: "Reps or timer")
    
    private let backgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = .specialBrown
        element.layer.cornerRadius = 10
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let setsView = SliderView(name: "Sets", maxValue: 50, type: .sets)
    
    private let chooseRepeatsLabel = UILabel(text: "Choose repeats or timer")
    
    private let repsView = SliderView(name: "Reps", maxValue: 50, type: .reps)
    private let timerView = SliderView(name: "Timer", maxValue: 600, type: .timer)
    
    private var mainStackView = UIStackView()
    
    //MARK: - Public Properties
    public var (sets, reps, timer) = (0, 0, 0)
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Views
    private func setupViews() {
        addSubview(repsOrTimerLabel)
        addSubview(backgroundView)
        
        mainStackView = UIStackView(
            arrangedSubviews: [setsView, chooseRepeatsLabel, repsView, timerView],
            axis: .vertical,
            spacing: 10
        )
        
        backgroundView.addSubview(mainStackView)
    }
    
    private func setDelegates() {
        setsView.delegate = self
        repsView.delegate = self
        timerView.delegate = self
    }
    
    //MARK: - Public Methods
    
    public func resetSliderViewValues() {
        setsView.resetValues()
        repsView.resetValues()
        timerView.resetValues()
    }
}

//MARK: - SliderViewProtocol
extension RepsOrTimerView: SliderViewProtocol {
    func changeValue(type: SliderTypes, value: Int) {
        switch type {
        case .sets:
            sets = value
        case .reps:
            reps = value
            repsView.isActive = true
            timerView.isActive = false
            timer = 0
        case .timer:
            timer = value
            timerView.isActive = true
            repsView.isActive = false
            reps = 0
        }
    }
}

//MARK: - Setup Constraints
extension RepsOrTimerView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: topAnchor),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            backgroundView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 5),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 280),
            
            mainStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 15),
            mainStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -15),
            mainStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            mainStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -15),
        ])
    }
}
