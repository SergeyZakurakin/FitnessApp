//
//  TimerWorkoutView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/20/24.
//

import UIKit

protocol NextSetTimerProtocol: AnyObject {
    func nextSetTapped()
    func editingTapped()
}

final class TimerWorkoutView: UIView {
    
    //MARK: - setup UI
    private let workoutBackground: UIView = {
        let element = UIView()
        element.backgroundColor = .specialBrown
        element.layer.cornerRadius = 10
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let workoutNameLabel = UILabel(
        text: "Biceps",
        font: .robotoBold24(),
        textColor: .specialGray
    )
    
    private var setsStackView = UIStackView()
    
    private let setsNameLabel = UILabel(
        text: "Sets",
        font: .robotoMedium22(),
        textColor: .specialGray
    )
    
    private let setsNumberLabel = UILabel(
        text: "1/4",
        font: .robotoMedium22(),
        textColor: .specialGray
    )
    
    private var setsSeparatorView = SeparatorView()
    
    private var timerStackView = UIStackView()
    
    private let timerNameLabel = UILabel(
        text: "Timer of set",
        font: .robotoMedium22(),
        textColor: .specialGray
    )
    
    private let timerNumberLabel = UILabel(
        text: "20",
        font: .robotoMedium22(),
        textColor: .specialGray
    )
    
    private var repsSeparatorView = SeparatorView()
    
    private lazy var editingButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("editing", for: .normal)
        element.setImage(UIImage(named: "pencil"), for: .normal)
        element.tintColor = .specialGray
        element.addTarget(self, action: #selector(editingButtonPressed), for: .touchUpInside)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var nextSetButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("NEXT SET", for: .normal)
        element.tintColor = .specialGray
        element.backgroundColor = .specialYellow
        element.addTarget(self, action: #selector(nextSetButtonPressed), for: .touchUpInside)
        element.layer.cornerRadius = 10
        element.titleLabel?.font = .robotoBold16()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    weak var cellNextSetTimerDelegate: NextSetTimerProtocol?
    
//    weak var cellNextSetDelegate: NextSetProtocol?
    
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   //MARK: - Actions
    @objc private func editingButtonPressed() {
        cellNextSetTimerDelegate?.editingTapped()
    }
    
    @objc private func nextSetButtonPressed() {
        cellNextSetTimerDelegate?.nextSetTapped()
    }
    
    
    
    //MARK: - Private Methods
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(workoutBackground)
        workoutBackground.addSubview(workoutNameLabel)
        
        setsStackView = UIStackView(
            arrangedSubviews: [setsNameLabel, setsNumberLabel],
            axis: .horizontal,
            spacing: 10)
        
        workoutBackground.addSubview(setsStackView)
        workoutBackground.addSubview(setsSeparatorView)
        
        timerStackView = UIStackView(
            arrangedSubviews: [timerNameLabel, timerNumberLabel],
            axis: .horizontal,
            spacing: 10)
        timerNumberLabel.textAlignment = .right
        
        workoutBackground.addSubview(timerStackView)
        workoutBackground.addSubview(repsSeparatorView)
        workoutBackground.addSubview(editingButton)
        workoutBackground.addSubview(nextSetButton)
    }
    
    //MARK: - Public Methods
    public func refreshLabels(model: WorkOutModel, numberOfSets: Int) {
        workoutNameLabel.text = model.workOutName
        setsNumberLabel.text = "\(numberOfSets)/\(model.workOutSets)"
        timerNumberLabel.text = "\(model.workOutTimer.getTimeFromSeconds())"
        
    }
    
    public func buttonsIsEnable(_ value: Bool) {
        editingButton.isEnabled = value
        nextSetButton.isEnabled = value
    }
}

//MARK: - Setup Constraints
extension TimerWorkoutView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            workoutBackground.topAnchor.constraint(equalTo: topAnchor),
            workoutBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            workoutBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            workoutBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            workoutBackground.heightAnchor.constraint(equalToConstant: 230),
            
            workoutNameLabel.centerXAnchor.constraint(equalTo: workoutBackground.centerXAnchor),
            workoutNameLabel.topAnchor.constraint(equalTo: workoutBackground.topAnchor, constant: 10),
            
            setsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 10),
            setsStackView.leadingAnchor.constraint(equalTo: workoutBackground.leadingAnchor, constant: 10),
            setsStackView.trailingAnchor.constraint(equalTo: workoutBackground.trailingAnchor, constant: -10),
            
            setsSeparatorView.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 5),
            setsSeparatorView.leadingAnchor.constraint(equalTo: workoutBackground.leadingAnchor, constant: 10),
            setsSeparatorView.trailingAnchor.constraint(equalTo: workoutBackground.trailingAnchor, constant: -10),
            setsSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            timerStackView.topAnchor.constraint(equalTo: setsSeparatorView.bottomAnchor, constant: 20),
            timerStackView.leadingAnchor.constraint(equalTo: workoutBackground.leadingAnchor, constant: 10),
            timerStackView.trailingAnchor.constraint(equalTo: workoutBackground.trailingAnchor, constant: -10),
            
            repsSeparatorView.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 5),
            repsSeparatorView.leadingAnchor.constraint(equalTo: workoutBackground.leadingAnchor, constant: 10),
            repsSeparatorView.trailingAnchor.constraint(equalTo: workoutBackground.trailingAnchor, constant: -10),
            repsSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            editingButton.topAnchor.constraint(equalTo: repsSeparatorView.bottomAnchor, constant: 10),
            editingButton.trailingAnchor.constraint(equalTo: repsSeparatorView.trailingAnchor, constant: -10),
            
            nextSetButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 10),
            nextSetButton.leadingAnchor.constraint(equalTo: workoutBackground.leadingAnchor, constant: 20),
            nextSetButton.trailingAnchor.constraint(equalTo: workoutBackground.trailingAnchor, constant: -20),
            nextSetButton.heightAnchor.constraint(equalToConstant: 40),

            
        ])
    }
}

