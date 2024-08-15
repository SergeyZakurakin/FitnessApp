//
//  MainTableView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/7/24.
//

import UIKit

protocol MainTableViewProtocol: AnyObject {
    func deleteWorkout(model: WorkOutModel, index: Int)
}

final class MainTableView: UITableView {
    
    //MARK: - Private Properties
    private var workoutArray: [WorkOutModel] = []
    
    weak var mainDelegate: MainTableViewProtocol?
    
    //MARK: - Life Cycle
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        configure()
        setDelegates()
        register(WorkoutTableViewCell.self, forCellReuseIdentifier: WorkoutTableViewCell.idTableViewCell)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // настройка отображения таблицы
    private func configure() {
        backgroundColor = .none
        separatorStyle = .none
        // оттяжка
        bounces = false
        showsVerticalScrollIndicator = false
        
        
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates() {
        delegate = self
        dataSource = self
    }
    
    //MARK: - Public Methods
    public func setWorkoutArray(array: [WorkOutModel]) {
        workoutArray = array
        
    }
    
}
//MARK: - UITableViewDataSource
extension MainTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workoutArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTableViewCell.idTableViewCell, for: indexPath) as? WorkoutTableViewCell else { return UITableViewCell()}
        let workoutModel = workoutArray[indexPath.row]
        cell.workoutCellDelegate = mainDelegate as? WorkoutCellProtocol
        cell.configure(model: workoutModel)
        
        return cell
    }
    
    
}
//MARK: - UITableViewDelegate
extension MainTableView: UITableViewDelegate {
    // Height for Row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    // delete with swipe method
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "") { [weak self] _, _, _ in
            guard let self else { return }
            let deleteModel = self.workoutArray[indexPath.row]
            self.mainDelegate?.deleteWorkout(model: deleteModel, index: indexPath.row)
        }
        action.backgroundColor = .specialBackground
        action.image = UIImage(named: "delete")
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}
