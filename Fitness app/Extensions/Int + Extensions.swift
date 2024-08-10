//
//  Int + Extensions.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/9/24.
//

import Foundation


extension Int {
    
    func getTimeFromSeconds() -> String {
        if self / 60 == 0 {
            return "\(self % 60)sec"
        } else if self % 60 == 0 {
            return "\(self / 60)min"
        } else {
            return "\(self / 60)min \(self % 60)sec"
        }
    }
}
