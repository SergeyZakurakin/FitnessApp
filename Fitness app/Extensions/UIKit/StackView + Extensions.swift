//
//  StackView + Extensions.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/7/24.
//

import UIKit

/*
 let stackView = UIStackView()
 stackView.addArrangesStackViews(yourView)
 stackView.addArrangesStackViews(myView)
 
 stackView.axis = .horizontal
 stackView.spacing = 10
 */

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = .equalSpacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    
}
