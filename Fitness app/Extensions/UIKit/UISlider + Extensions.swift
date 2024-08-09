//
//  UISlider + Extensions.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/9/24.
//

import UIKit

extension UISlider {
    convenience init(maxValue: Float) {
        self.init()
        self.minimumValue = 0
        self.maximumValue = maxValue
        self.value = 4
        self.maximumTrackTintColor = .specialLightBrown
        self.minimumTrackTintColor = .specialGreen
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

