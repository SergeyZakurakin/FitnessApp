//
//  RepsOrTimerView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/8/24.
//

import UIKit

class RepsOrTimerView: UIView {
    //MARK: - UI
    
    private let repsOrTimerLabel = UILabel(text: "Reps or timer")
    
    private var setsStackView = UIStackView()
    private let setsLabel = UILabel(text: "Sets", font: .robotoBold16(), textColor: .specialGray)
    private let numbersSetsLabel = UILabel(text: "4", font: .robotoBold20(), textColor: .specialGray)
    private lazy var setsSlider = UISlider(maxValue: 10)
    
    private let chooseRepeatsLabel = UILabel(text: "Choose repeats or timer")
    
    private var repsStackView = UIStackView()
    private let repsLabel = UILabel(text: "Reps", font: .robotoBold16(), textColor: .specialGray)
    private let numbersRepsLabel = UILabel(text: "10", font: .robotoBold20(), textColor: .specialGray)
    private lazy var repsSlider = UISlider(maxValue: 10)
    
    private var timerStackView = UIStackView()
    private let timerLabel = UILabel(text: "Timer", font: .robotoBold16(), textColor: .specialGray)
    private let numberTimerLabel = UILabel(text: "1min 30sec", font: .robotoBold20(), textColor: .specialGray)
    private lazy var timerSlider = UISlider(maxValue: 600)
    
//    var isActive: Bool {
//        didSet {
//            if isActive == true {
//                repsLabel.alpha = 1
//                numbersRepsLabel.alpha = 1
//                repsSlider.alpha = 1
//            } else {
//                timerLabel.alpha = 0.5
//                numberTimerLabel.alpha = 0.5
//                timerSlider.alpha = 0.5
//            }
//        }
//    }
    
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
        
        setsSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        repsSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        timerSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    }
    
    //MARK: - Private Actions
    @objc private func sliderChanged() {
        numbersSetsLabel.text = "\(Int(setsSlider.value))"
        numbersRepsLabel.text = "\(Int(repsSlider.value))"
        numberTimerLabel.text = "\(Int(timerSlider.value).getTimeFromSeconds())"
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
