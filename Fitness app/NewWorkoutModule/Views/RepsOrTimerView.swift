//
//  RepsOrTimerView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/8/24.
//

import UIKit

class RepsOrTimerView: UIView {
    //MARK: - UI
    
    private let repsOrTimerLabel = UILabel(text: "repsOrTimerLabel")
    
    
    private let setsLabel: UILabel = {
        let element = UILabel()
        element.text = "Sets"
        element.font = .robotoBold16()
        element.textColor = .specialGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let numbersSetsLabel: UILabel = {
        let element = UILabel()
        element.text = "4"
        element.font = .robotoBold20()
        element.textColor = .specialGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var setsSlider: UISlider = {
        let element = UISlider()
        element.minimumValue = 0
        element.maximumValue = 10
        element.value = 4
        element.maximumTrackTintColor = .specialLightBrown
        element.minimumTrackTintColor = .specialGreen
        element.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var setsStackView = UIStackView()
    
    private let chooseRepeatsLabel = UILabel(text: "Choose repeats or timer")
    
    private let repsLabel: UILabel = {
        let element = UILabel()
        element.text = "Reps"
        element.font = .robotoBold16()
        element.textColor = .specialGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let numbersRepsLabel: UILabel = {
        let element = UILabel()
        element.text = "10"
        element.font = .robotoBold20()
        element.textColor = .specialGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var repsSlider: UISlider = {
        let element = UISlider()
        element.minimumValue = 0
        element.maximumValue = 10
        element.maximumTrackTintColor = .specialLightBrown
        element.minimumTrackTintColor = .specialGreen
        element.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var repsStackView = UIStackView()
    
    private let timerLabel: UILabel = {
        let element = UILabel()
        element.text = "Timer"
        element.font = .robotoBold16()
        element.textColor = .specialLightBrown
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let numberTimerLabel: UILabel = {
        let element = UILabel()
        element.text = "1min 30sec"
        element.font = .robotoBold20()
        element.textColor = .specialLightBrown
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var timerSlider: UISlider = {
        let element = UISlider()
        element.minimumValue = 0
        element.maximumValue = 10
        element.maximumTrackTintColor = .specialLightBrown
        element.minimumTrackTintColor = .specialGreen
        element.addTarget(self, action: #selector(timerSliderChanged), for: .valueChanged)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var timerStackView = UIStackView()
    

    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupViews()
        setConstraints()
    }
    
    private let backgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = .specialBrown
        element.layer.cornerRadius = 10
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Views
    private func setupViews() {
        
        addSubview(repsOrTimerLabel)
        addSubview(backgroundView)
        
        setsStackView = UIStackView(
            arrangedSubviews: [setsLabel, numbersSetsLabel],
            axis: .horizontal,
            spacing: 0
        )
        backgroundView.addSubview(setsStackView)
        backgroundView.addSubview(setsSlider)
        
        backgroundView.addSubview(chooseRepeatsLabel)
        
        repsStackView = UIStackView(
            arrangedSubviews: [repsLabel, numbersRepsLabel],
            axis: .horizontal,
            spacing: 0
        )
        backgroundView.addSubview(repsStackView)
        backgroundView.addSubview(repsSlider)
        
        timerStackView = UIStackView(
            arrangedSubviews: [timerLabel, numberTimerLabel],
            axis: .horizontal,
            spacing: 0
        )
        backgroundView.addSubview(timerStackView)
        backgroundView.addSubview(timerSlider)
        
        
        
    }
    
    
    //MARK: - Actions
    
    @objc private func setsSliderChanged() {
        print(setsSlider.value)
    }
    
    @objc private func repsSliderChanged() {
        print(repsSlider.value)
    }
    
    @objc private func timerSliderChanged() {
        print(timerSlider.value)
        
        
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
            
            setsStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            setsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            setsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            setsSlider.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 10),
            setsSlider.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            setsSlider.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            chooseRepeatsLabel.topAnchor.constraint(equalTo: setsSlider.bottomAnchor, constant: 20),
            chooseRepeatsLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            
            repsStackView.topAnchor.constraint(equalTo: chooseRepeatsLabel.bottomAnchor, constant: 10),
            repsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            repsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 10),
            repsSlider.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            repsSlider.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 10),
            timerStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            timerStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            timerSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 10),
            timerSlider.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            timerSlider.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            
            

            
            
        
        
        
        ])
    }
    
    
    
}
