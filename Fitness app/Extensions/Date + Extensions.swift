//
//  Date + Extensions.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/10/24.
//

import Foundation


extension Date {
    
    func getWeekDayNumber() -> Int {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
}
