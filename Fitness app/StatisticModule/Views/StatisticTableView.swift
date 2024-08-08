//
//  StatisticTableView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/7/24.
//

import UIKit

class StatisticTableView: UITableView {
    
    
    //MARK: - Life Cycle
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        
        configure()
        setDelegates()
        
        register(StatisticTableViewCell.self, forCellReuseIdentifier: StatisticTableViewCell.idTableViewCell)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure tableView
    private func configure() {
        bounces = false
        backgroundColor = .none
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Set Delegates
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
}

//MARK: - UITableViewDataSource
extension StatisticTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StatisticTableViewCell.idTableViewCell, for: indexPath) as? StatisticTableViewCell else { return UITableViewCell() }
        
        
        return cell
    }
}


//MARK: - UITableViewDelegate
extension StatisticTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
