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
    
    // setup TimeZone
    func localeDate() -> Date {
        let timezoneOffset = Double(TimeZone.current.secondsFromGMT(for: self))
        let localDate = Calendar.current.date(byAdding: .second, value: Int(timezoneOffset), to: self) ?? Date()
        return localDate
    }
    
    // get short weekDay
    func getWeekArray() -> [[String]] {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "EEEEEE"
        let calendar = Calendar.current
        
        var weekArray: [[String]] = [[], []]
        
        for index in -6...0 {
            let date = calendar.date(byAdding: .day, value: index, to: self) ?? Date()
            let day = calendar.component(.day, from: date)
            weekArray[1].append("\(day)")
            let weekDay = formatter.string(from: date)
            weekArray[0].append(weekDay)
        }
        return weekArray
    }
    
    func offsetDay(day: Int) -> Date {
        let offsetDate = Calendar.current.date(byAdding: .day, value: -day, to: self) ?? Date()
        return offsetDate
    }
    
    
    func offsetMonth(month: Int) -> Date {
        let offsetDay = Calendar.current.date(byAdding: .month, value: -month, to: self) ?? Date()
        return offsetDay
    }
    
    
    
    func startEndDate() -> (start: Date, end: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        
        let dateStart = formatter.date(from: "\(year)/\(month)/\(day)") ?? Date()
        
        let local = dateStart.localeDate()
        let dateEnd: Date = {
            let components = DateComponents(day: 1)
            return calendar.date(byAdding: components, to: local) ?? Date()
        }()
        return (local, dateEnd)
    }
    
    func ddmmYYFromDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let date = formatter.string(from: self)
        return date
    }
}
