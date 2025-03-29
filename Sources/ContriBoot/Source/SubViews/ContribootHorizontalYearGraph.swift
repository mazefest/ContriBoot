//
//  ContribootHorizontalYearGraph.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/29/25.
//

import SwiftUI

struct ContribootHorizontalYearGraph: View {
    var year: ContriBootYear
    var startOfWeek: DayOfWeek
    var contributions: [Int: [Contributable]] = [:]
    
    // for drawing items
    private let daysInYear: Int
    private let beginningOffsetOfCurrentYear: Int
    private let endOffsetOfCurrentYear: Int
    
    // for contribute
    var contributeViewStyle: ContributeViewStyle
    private var highestCount: Int = 0
    
    init(
        items: [Contributable],
        year: ContriBootYear = .currentYear,
        startOfWeek: DayOfWeek = .sunday,
        contributeViewStyle: ContributeViewStyle = BinaryContributeStyle()
    ) {
        self.year = year
        self.startOfWeek = startOfWeek
        self.contributeViewStyle = contributeViewStyle
        self.daysInYear = year.daysInYear
        self.beginningOffsetOfCurrentYear = year.date.beginningOffsetOfCurrentYear(startOfWeek: startOfWeek)
        self.endOffsetOfCurrentYear = year.date.endOffsetOfCurrentYear(startOfWeek: startOfWeek)
        
        for item in items {
            if item.date.dateComponents.year == year.yearValue {
                let index = item.date.indexOfDayInYear()
                contributions[index, default: []].append(item)
            }
        }
        
        highestCount = contributions.values.max(by: { $0.count < $1.count })?.count ?? 0
    }
    
    var body: some View {
        HStack {
            LazyHGrid(rows: Array(repeating: GridItem(.fixed(20.0)), count: 7), content: {
                ForEach(0..<beginningOffsetOfCurrentYear, id: \.self) { i in
                    ContributionSquareView(color: .defaultFillerColor)
                }
                
                ForEach(0..<daysInYear, id: \.self) { index in
                    contributionSquare(index: index)
                        .id(index)
                }
                
                ForEach(0..<endOffsetOfCurrentYear, id: \.self) { i in
                    ContributionSquareView(color: .defaultFillerColor)
                }
            })
        }
    }
    
    @ViewBuilder
    func contributionSquare(index: Int) -> some View {
        if let style = self.contributeViewStyle as? BinaryContributeStyle {
            AnyView(ContributionSquareView(
                color: style.color(for: (contributions[index] ?? []).count),
                cornerRadius: style.cornerRadius
            ))
        } else if let style = self.contributeViewStyle as? GradientContributeStyle {
            AnyView(ContributionSquareView(
                color: style.color(for: (contributions[index] ?? []).count, highestCount: highestCount),
                cornerRadius: style.cornerRadius
            ))
        } else if let style = self.contributeViewStyle as? CustomContributeStyle {
            AnyView(style.customView(contributions[index] ?? []))
        }
    }
}

#Preview {
    ScrollView(.horizontal) {
        ContribootHorizontalYearGraph(items: Workout.generateTestWorkouts())
    }
}

extension Date {
    var dateComponents: DateComponents {
        Calendar.current.dateComponents([.year, .month, .day], from: self)
    }
}
