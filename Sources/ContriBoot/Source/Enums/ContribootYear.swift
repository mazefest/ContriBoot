//
//  ContribootYear.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/29/25.
//

import SwiftUI

enum ContribootYear {
    case year(Int)
    case currentYear
    
    var yearValue: Int {
        return switch self {
        case .year(let value): value
        case .currentYear: Calendar.current.component(.year, from: Date())
        }
    }
    
    var date: Date {
        var components = DateComponents()
        components.year = self.yearValue
        return Calendar.current.date(from: components)!
    }
    
    var daysInYear: Int {
        date.daysInYear()
    }
}
