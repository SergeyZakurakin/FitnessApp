//
//  UIButton + Extensions.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/8/24.
//

import UIKit

extension UIButton {
    convenience init(text: String) {
        self.init(type: .system)

        self.setTitle(text, for: .normal)
        self.tintColor = .white
        self.backgroundColor = .specialGreen
        self.layer.cornerRadius = 10
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
    
    
    
    
    

