//
//  TimerWorkoutViewController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/20/24.
//


import UIKit



final class TimerWorkoutViewController: UIViewController {
    
    //MARK: - UI
    private let startWorkoutLabel = UILabel(
        text: "START WORKOUT",
        font: .robotoBold24(),
        textColor: .specialGray
    )
    
    private lazy var closeButton = CloseButton(type: .system)
    
    private let ellipseImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "ellipse")
        element.contentMode = .scaleAspectFit
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let timeWorkoutLabel = UILabel(text: "1:35", font: .robotoBold48(), textColor: .specialGray)
    
    private let detailsLabel = UILabel(text: "Details")
    private lazy var finishButton = UIButton(text: "FINISH")
    private let timerWorkoutView = TimerWorkoutView()
    
    private var workoutModel = WorkOutModel()
    private let customAlert = CustomAlert()
    private let shapeLayer = CAShapeLayer()
    private var timer = Timer()
    
    // delete
    private var durationTimer = 10
    private var numberOfSet = 0
    
    //MARK: - Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        animationCircular()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        addTaps()
        setWorkoutParameters()
        
    }
    
    //MARK: - Private Methods
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(ellipseImageView)
        view.addSubview(timeWorkoutLabel)
        view.addSubview(detailsLabel)
        timerWorkoutView.refreshLabels(model: workoutModel, numberOfSets: numberOfSet)
        view.addSubview(timerWorkoutView)
//        timerWorkoutView.refreshLabels(model: workoutModel, numberOfSets: numberOfSet)
//        repsWorkoutView.cellNextSetDelegate = self
        view.addSubview(finishButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        finishButton.addTarget(self, action: #selector(finishButtonPressed), for: .touchUpInside)
        
        timerWorkoutView.cellNextSetTimerDelegate = self
    }
    
    // start label action with tap
    private func addTaps() {
        let tapLabel = UITapGestureRecognizer(target: self, action: #selector(startTimer))
        timeWorkoutLabel.isUserInteractionEnabled = true
        timeWorkoutLabel.addGestureRecognizer(tapLabel)
        
    }
    
    @objc private func startTimer() {
//        basicAnimation()
        timerWorkoutView.buttonsIsEnable(false)
        
        if numberOfSet == workoutModel.workOutSets {
            presentSimpleAlert(title: "Error", message: "Finish your workout")
        } else {
            basicAnimation()
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(timerAction),
                userInfo: nil,
                repeats: true)
            
        }
        print("go")
    }
    
    @objc private func timerAction() {
        durationTimer -= 1
        print(durationTimer)
        
        if durationTimer == 0 {
            timer.invalidate()
            durationTimer = workoutModel.workOutTimer
            numberOfSet += 1
            timerWorkoutView.refreshLabels(model: workoutModel, numberOfSets: numberOfSet)
            timerWorkoutView.buttonsIsEnable(true)
        }
        
        let (min, sec) = durationTimer.convertSeconds()
        timeWorkoutLabel.text = "\(min):\(sec.setZeroForSeconds())"
    }
    
    private func setWorkoutParameters() {
        let (min, sec) = workoutModel.workOutTimer.convertSeconds()
        timeWorkoutLabel.text = "\(min):\(sec.setZeroForSeconds())"
        durationTimer = workoutModel.workOutTimer
    }
    
    
    //MARK: - Actions
    @objc private func closeButtonPressed() {
        timer.invalidate()
        dismiss(animated: true)
    }
    
    @objc private func finishButtonPressed() {
        if numberOfSet == workoutModel.workOutSets {
            RealmManager.shared.updateStatusWorkoutModel(model: workoutModel)
            dismiss(animated: true)
        } else {
            presentAlertWithActions(
                title: "Warning",
                message: "You haven't finished your workout") {
                    self.dismiss(animated: true)
                }
        }
    }
    
    //MARK: - Public Methods
    public func setWorkoutModel(_ model: WorkOutModel) {
        workoutModel = model
    }
}

//MARK: - NextSetProtocol
//extension RepsWorkoutViewController: NextSetProtocol {
//    func nextSetTapped() {
//        if numberOfSet < workoutModel.workOutSets {
//            numberOfSet += 1
//            repsWorkoutView.refreshLabels(model: workoutModel, numberOfSets: numberOfSet)
//        } else {
//            presentSimpleAlert(title: "Error", message: "Finish your workouts")
//        }
//    }
//    
//    func editingTapped() {
//        customAlert.presentCustomAlert( viewController: self, repsOrTimer: "Reps") { [weak self] sets, reps in
//            guard let self else { return }
//            if sets != "" && reps != "" {
//                guard let numberOfSets = Int(sets),
//                      let numberOfReps = Int(reps) else { return }
//                RealmManager.shared.updateSetsRepsWorkoutModel(
//                    model: workoutModel,
//                    sets: numberOfSets,
//                    reps: numberOfReps
//                )
//                repsWorkoutView.refreshLabels(model: workoutModel, numberOfSets: numberOfSet)
//            }
//        }
//    }
//}
//MARK: - NextSetProtocol
extension TimerWorkoutViewController: NextSetTimerProtocol {
    func nextSetTapped() {
        if numberOfSet < workoutModel.workOutSets {
            numberOfSet += 1
            timerWorkoutView.refreshLabels(model: workoutModel, numberOfSets: numberOfSet)
        } else {
            presentSimpleAlert(title: "Error", message: "Finish your workouts")
        }
    
    }
    
    func editingTapped() {
        customAlert.presentCustomAlert( viewController: self, repsOrTimer: "Timer of set") { [weak self] sets, timerOfSet in
            guard let self else { return }
            if sets != "" && timerOfSet != "" {
                guard let numberOfSets = Int(sets),
                      let numberOfTimer = Int(timerOfSet) else { return }
                RealmManager.shared.updateSetsTimerWorkoutModel(model: workoutModel, sets: numberOfSets, timer: numberOfTimer)
                
                let (min, sec) = numberOfTimer.convertSeconds()
                timeWorkoutLabel.text = "\(min):\(sec.setZeroForSeconds())"
                durationTimer = numberOfTimer

                timerWorkoutView.refreshLabels(model: workoutModel, numberOfSets: numberOfSet)
            }
        }
    }
    
}




//MARK: - Animation
extension TimerWorkoutViewController {
    private func animationCircular() {
        
        let center = CGPoint(
            x: ellipseImageView.frame.width / 2 ,
            y: ellipseImageView.frame.height / 2)
        
        let endAngle = (-CGFloat.pi / 2)
        let startAngle = 2 * CGFloat.pi + endAngle
        
        let circularPath = UIBezierPath(
            arcCenter: center,
            radius: 120,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: false)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 21
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.specialGreen.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = .round
        ellipseImageView.layer.addSublayer(shapeLayer)
        
    }
    
    private func basicAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(durationTimer)
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
    
//    shapeLayer.path = circularPath.cgPath
//    shapeLayer.lineWidth = 21
//    shapeLayer.fillColor = UIColor.clear.cgColor
//    shapeLayer.strokeColor = UIColor.specialGreen.cgColor
//    shapeLayer.strokeEnd = 1
//    shapeLayer.lineCap = .round
//    ellipseImageView.layer.addSublayer(shapeLayer)
//}
//
//private func basicAnimation() {
//    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
//    basicAnimation.toValue = 0
//    basicAnimation.duration = CFTimeInterval(durationTimer)
//    basicAnimation.isRemovedOnCompletion = true
//    shapeLayer.add(basicAnimation, forKey: "basicAnimation")
//}
}

//MARK: - setup Constraints
extension TimerWorkoutViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            
            ellipseImageView.centerXAnchor.constraint(equalTo: startWorkoutLabel.centerXAnchor),
            ellipseImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 20),
            
            timeWorkoutLabel.centerXAnchor.constraint(equalTo: ellipseImageView.centerXAnchor),
            timeWorkoutLabel.centerYAnchor.constraint(equalTo: ellipseImageView.centerYAnchor),

            detailsLabel.topAnchor.constraint(equalTo: ellipseImageView.bottomAnchor, constant: 15),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            timerWorkoutView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor),
            timerWorkoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            timerWorkoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            finishButton.topAnchor.constraint(equalTo: timerWorkoutView.bottomAnchor, constant: 10),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            finishButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
