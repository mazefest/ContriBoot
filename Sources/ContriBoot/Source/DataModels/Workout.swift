//
//  Workout.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/27/25.
//

import SwiftUI

struct Workout: Contributable {
    var date: Date
}

extension Workout {
    static func generateTestWorkouts() -> [Workout] {
        var dates = Date.generateDates(in: Date().startOfYear()...Date().endOfYear())
        dates.append(contentsOf: Date.generateDates(in: Date().startOfYear()...Date().endOfYear()))
        dates.append(contentsOf: Date.generateDates(in: Date().startOfYear()...Date().endOfYear()))
        return dates.compactMap { Workout(date: $0)}
    }
}
