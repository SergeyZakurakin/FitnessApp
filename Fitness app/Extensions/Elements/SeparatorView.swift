//
//  SeparatorView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/12/24.
//

import UIKit

class SeparatorView: UIView {
    
    
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurations() {
        backgroundColor = .specialLine
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}




