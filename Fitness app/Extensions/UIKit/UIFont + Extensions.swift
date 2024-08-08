//
//  UIFont + Extension.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/6/24.
//

import UIKit

// extension для UIFont вызывать только шрифты которые нужны в приложении
extension UIFont {
    
//    label.font = UIFont(name: "Roboto-Medium", size: 24)

    //Medium
    static func robotoMedium12() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 12)
    }
    
    static func robotoMedium14() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 14)
    }
    
    static func robotoMedium16() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 16)
    }
    
    static func robotoMedium18() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 18)
    }
    
    static func robotoMedium22() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 22)
    }
    
    static func robotoMedium24() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 24)
    }
    
    //Bold
    static func robotoBold12() -> UIFont? {
        return UIFont.init(name: "Roboto-Bold", size: 12)
    }
    
    static func robotoBold16() -> UIFont? {
        return UIFont.init(name: "Roboto-Bold", size: 16)
    }
    
    static func robotoBold20() -> UIFont? {
        return UIFont.init(name: "Roboto-Bold", size: 20)
    }
    
    static func robotoBold24() -> UIFont? {
        return UIFont.init(name: "Roboto-Bold", size: 24)
    }
    
    static func robotoBold48() -> UIFont? {
        return UIFont.init(name: "Roboto-Bold", size: 48)
    }
}

