//
//  MainTableView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/7/24.
//

import UIKit

class MainTableView: UITableView {
    
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
    
}
//MARK: - UITableViewDataSource
extension MainTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTableViewCell.idTableViewCell, for: indexPath) as? WorkoutTableViewCell else { return UITableViewCell()}
        
        
        
        return cell
    }
    
    
}
//MARK: - UITableViewDelegate
extension MainTableView: UITableViewDelegate {
    // метод высоты ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
