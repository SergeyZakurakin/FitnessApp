//
//  MainViewController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/5/24.
//

import UIKit

final class MainViewController: UIViewController {

    //MARK: - Setup UI
    private let userImageImageView: UIImageView = {
        let element = UIImageView()
        element.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)  // #colorLiteral() (note)
        element.layer.borderColor = UIColor.white.cgColor
        element.layer.borderWidth = 5
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let userNameLabel: UILabel = {
        let element = UILabel()
        element.text = "Your name"
        element.numberOfLines = 0
        element.adjustsFontSizeToFitWidth = true
        element.font = .robotoMedium24()
        element.textColor = .specialGray
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var addWorkoutButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = .specialYellow
        element.tintColor = .specialDarkGreen
        element.titleLabel?.font = .robotoMedium12()
        // deprecated redo!
        element.imageEdgeInsets = .init(
            top: 0,
            left: 20,
            bottom: 15,
            right: 0
        )
        element.titleEdgeInsets = .init(
            top: 50,
            left: -40,
            bottom: 0,
            right: 0
        )
        element.addShadowOnView()
        
        element.layer.cornerRadius = 10
        element.setTitle("Add workout", for: .normal)
        element.setImage(UIImage(named: "plus"), for: .normal)
        element.addTarget(self, action: #selector(addWorkoutButtonPressed), for: .touchUpInside)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let noWorkoutImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "noImage")
        element.contentMode = .scaleAspectFit
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // green View on main screen
    private let calendarView = CalendarView()
    // white View with sun
    private let weatherView = WeatherView()

    private let workoutTodayLabel = UILabel(text: "Workout today")
    
    private let workoutTableView = MainTableView()
    
    //MARK: - Private Properties
    private var workoutArray: [WorkOutModel] = []
    
    

    //MARK: - Life Cycle
    override func viewDidLayoutSubviews() {
        // лого аватар (радиус делим на размер чтоб было круглое)
        userImageImageView.layer.cornerRadius = userImageImageView.frame.width / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        selectItem(date: Date())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        selectItem(date: Date())
        
    }

    //MARK: - Setup Views
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(calendarView)
        
        calendarView.SetDelegate(self)
        
        view.addSubview(userImageImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(weatherView)
        view.addSubview(workoutTodayLabel)
        view.addSubview(workoutTableView)
        workoutTableView.mainDelegate = self
        view.addSubview(noWorkoutImageView)
        
        
    }
    
    @objc private func addWorkoutButtonPressed() {
        let newWorkoutVC = NewWorkoutViewController()
        // setup presentation
        newWorkoutVC.modalPresentationStyle = .fullScreen
        
        present(newWorkoutVC, animated: true)
    }
    
    private func getWorkouts(date: Date) {
        let weekday = date.getWeekDayNumber()
        let dateStart = date.startEndDate().start
        let dateEnd = date.startEndDate().end
        
        let predicateRepeat = NSPredicate(format: "workOutNumberOfDay = \(weekday) AND workOutRepeat = true")
        let predicateOffRepeat = NSPredicate(format: "workOutRepeat = false AND workOutDate BETWEEN %@", [dateStart, dateEnd])
        
        let compound = NSCompoundPredicate(type: .or, subpredicates: [predicateRepeat, predicateOffRepeat])
        
        let resultArray = RealmManager.shared.getResultWorkoutModel()
        let filteredArray = resultArray.filter(compound).sorted(byKeyPath: "workOutName")
        workoutArray = filteredArray.map { $0 }
    }
    
    private func checkWorkoutToday() {
        if workoutArray.count == 0 {
            noWorkoutImageView.isHidden = false
            workoutTableView.isHidden = true
        } else {
            noWorkoutImageView.isHidden = true
            workoutTableView.isHidden = false
        }
    }
}

//MARK: - WorkoutCellProtocol
extension MainViewController: WorkoutCellProtocol {
    func startButtonPressed(model: WorkOutModel) {
        if model.workOutTimer == 0 {
            print("Reps")
        } else {
            print("Timer")
        }
    }
    
    
}



//MARK: - CalendarViewProtocol
extension MainViewController: CalendarViewProtocol {
    func selectItem(date: Date) {
//        print(date.startEndDate().start, date.startEndDate().end)
        getWorkouts(date: date)
        workoutTableView.setWorkoutArray(array: workoutArray)
        workoutTableView.reloadData()
        checkWorkoutToday()
//        print(workoutArray)
    }
}

//MARK: - MainTableViewProtocol
extension MainViewController: MainTableViewProtocol {
    func deleteWorkout(model: WorkOutModel, index: Int) {
        RealmManager.shared.deleteWorkoutModel(model)
        workoutArray.remove(at: index)
        workoutTableView.setWorkoutArray(array: workoutArray)
        workoutTableView.reloadData()
    }
    
    
}

//MARK: - Setup Constraints
extension MainViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            userImageImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userImageImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userImageImageView.heightAnchor.constraint(equalToConstant: 100),
            userImageImageView.widthAnchor.constraint(equalToConstant: 100),
            
            calendarView.topAnchor.constraint(equalTo: userImageImageView.centerYAnchor),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 70),
            
            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageImageView.trailingAnchor, constant: 5),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor,constant: 10),
            addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
            
            weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 10),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
            weatherView.heightAnchor.constraint(equalToConstant: 80),
            
            workoutTodayLabel.topAnchor.constraint(equalTo: addWorkoutButton.bottomAnchor, constant: 10),
            workoutTodayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            workoutTableView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor),
            workoutTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            workoutTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            workoutTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            noWorkoutImageView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor),
            noWorkoutImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            noWorkoutImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            noWorkoutImageView.heightAnchor.constraint(equalTo: noWorkoutImageView.widthAnchor, multiplier: 1),

            
        ])
    }
}
