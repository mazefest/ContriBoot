//
//  DayOfWeek.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/27/25.
//

import SwiftUI

public enum DayOfWeek: String, Identifiable {
    public var id: Self { return self }
    
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    public var title: String {
        return self.rawValue.capitalized
    }
    
    public var letter: String {
        return self.rawValue.first?.uppercased() ?? ""
    }
    
    /**
        - Returns: returns abbreviated forms of the days of week. ex: 3 characters for all days of the week (mon, tue).
     */
    public var abbreviated: String {
        switch self {
        default:
            return String(self.rawValue.capitalized.prefix(3))
        }
    }
    
    public func offSet(start: Self) -> Int {
        guard let index = Self.alldays(start: start).firstIndex(where: { $0 == self }) else {
            fatalError("DayOfWeek offset calculation failed.")
        }
        return index
    }
    
    public static var allCases: [Self] {
        return [.monday, .tuesday, .wednesday, .thursday, .friday, .saturday, .sunday]
    }
    
    public static func alldays(start: Self) -> [Self] {
        guard let firstIndex = Self.allCases.firstIndex(of: start) else {
            return []
        }
        
        var daysOfWeek = Array(Self.allCases[firstIndex..<allCases.count])
        daysOfWeek.append(contentsOf: Array(allCases[0..<firstIndex]))
        return daysOfWeek
        
    }
    
    public static func allCasesStartingToday() -> [Self] {
        let today = DayOfWeek.create(from: Date())
        let startingIndex = Self.allCases.firstIndex(of: today)!
        let front: [DayOfWeek] = Array(allCases[0...startingIndex]).reversed() //m, t, w
        let back: [DayOfWeek] = Array(allCases[(startingIndex + 1)..<allCases.count]).reversed() // w,r,f,s,s]
        return (front + back)
    }
    
    public var endOfDay: Date {
        let index = Self.allCasesStartingToday().firstIndex(of: self)
        let today = Date()
        let indexedDate = Calendar.current.date(byAdding: .day, value: index! * -1, to: today)
        return indexedDate!.endOfDay
    }
    
    public var startOfDay: Date {
        let index = Self.allCasesStartingToday().firstIndex(of: self)
        
        let today = Date()
        let indexedDate = Calendar.current.date(byAdding: .day, value: index! * -1, to: today)
        return indexedDate!.startOfDay
    }
    
    public var dayNumber: String {
        return startOfDay.descriptor(.dayNumbered)
    }
    
    static public func create(from date: Date) -> Self {
        let dayOfWeek = date.descriptor(.dayOfWeek)
        for day in DayOfWeek.allCases {
            if day.title == dayOfWeek {
                return day
            }
        }
        fatalError()
    }
}
