//
//  CalendarView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/5/24.
//

import UIKit

final class CalendarView: UIView {
    
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Views
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.2, green: 0.5529411765, blue: 0.4901960784, alpha: 1)
        layer.cornerRadius = 10
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
}
//MARK: - Setup Constraints
extension CalendarView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
        
        
        
        ])
        
        
        
    }
}
