//
//  GreenSlider.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/9/24.
//

import UIKit

class GreenSlider: UISlider {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurations() {
        self.maximumTrackTintColor = .specialLightBrown
        self.minimumTrackTintColor = .specialGreen
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
