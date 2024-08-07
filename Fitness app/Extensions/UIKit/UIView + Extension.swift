//
//  UIView + Extension.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/6/24.
//

import UIKit

// extension для UIView чтоб не повторять настройку тени
extension UIView {
    
    func addShadowOnView() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1
    }
}
