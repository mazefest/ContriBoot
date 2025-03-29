//
//  ContribootYear.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/29/25.
//

import SwiftUI

public enum ContriBootYear {
    case year(Int)
    case currentYear
    
    public var yearValue: Int {
        return switch self {
        case .year(let value): value
        case .currentYear: Calendar.current.component(.year, from: Date())
        }
    }
    
    public var date: Date {
        var components = DateComponents()
        components.year = self.yearValue
        return Calendar.current.date(from: components)!
    }
    
    public var daysInYear: Int {
        date.daysInYear()
    }
}
