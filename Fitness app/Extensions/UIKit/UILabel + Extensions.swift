//
//  UILabel.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/7/24.
//

import UIKit

extension UILabel {
    convenience init(text: String = "") {
        self.init()
        
        self.text = text
        self.font = .robotoMedium14()
        self.textColor = .specialLightBrown
        // свойство для сужения
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
//    convenience init(setsText: String = "") {
//        self.init()
//        self.text = setsText
//        self.font = .robotoBold16()
//        self.textColor = .specialGray
//        self.translatesAutoresizingMaskIntoConstraints = false
//    }
    
}
