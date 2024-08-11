//
//  CloseButton.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/10/24.
//

import UIKit

class CloseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configurations() {
            setBackgroundImage(UIImage(named: "Close Button"), for: .normal)
            translatesAutoresizingMaskIntoConstraints = false 
    }   
}
