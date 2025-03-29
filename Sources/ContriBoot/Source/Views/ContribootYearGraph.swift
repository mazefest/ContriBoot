//
//  ContributionGraphHorizontalYear.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/27/25.
//

import SwiftUI

public struct ContriBootYearGraph: View {
    public var items: [Contributable]
    public var year: ContriBootYear
    public var startOfWeek: DayOfWeek
    public var contributeViewStyle: ContributeViewStyle
    
    public init(
        items: [Contributable],
        year: ContriBootYear = .currentYear,
        startOfWeek: DayOfWeek = .sunday,
        contributeViewStyle: ContributeViewStyle = BinaryContributeStyle()
    ) {
        self.items = items
        self.year = year
        self.startOfWeek = startOfWeek
        self.contributeViewStyle = contributeViewStyle
    }
    
    public var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                StackedDayOfWeekIndicators(startOfWeek: startOfWeek)
                
                ContribootLabeledYearGraph(
                    items: items,
                    year: year,
                    startOfWeek: startOfWeek,
                    contributeViewStyle: contributeViewStyle
                )
                
            }
        }
    }
}

extension ContriBootYearGraph {
    public func contributeStyle(_ contributionStyle: ContributeViewStyle) -> ContriBootYearGraph {
        var copy = self
        copy.contributeViewStyle = contributionStyle
        return copy
    }
}


#Preview {
    List {
        Section("Gradient") {
            ContriBootYearGraph(items: Workout.generateTestWorkouts())
                .contributeStyle(GradientContributeStyle())
        }
        
        Section("Gradient: Blue") {
            ContriBootYearGraph(items: Workout.generateTestWorkouts())
                .contributeStyle(GradientContributeStyle(color: .blue))
        }
            
        Section("Gradient: Pink") {
            ContriBootYearGraph(items: Workout.generateTestWorkouts())
                .contributeStyle(GradientContributeStyle(color: .pink))
        }
        
        Section("Binary") {
            ContriBootYearGraph(items: Workout.generateTestWorkouts())
                .contributeStyle(BinaryContributeStyle())
        }
            
        Section("Binary: Blue") {
            ContriBootYearGraph(items: Workout.generateTestWorkouts())
                .contributeStyle(BinaryContributeStyle(color: .blue))
        }
        
        Section("Binary: Pink") {
            ContriBootYearGraph(items: Workout.generateTestWorkouts())
                .contributeStyle(BinaryContributeStyle(color: .pink))
        }

        Section("Custom") {
            ContriBootYearGraph(items: Workout.generateTestWorkouts())
                .contributeStyle(CustomContributeStyle({ contributes in
                    Color.black
                        .cornerRadius(3.0)
                        .overlay {
                            Text("\(contributes.count)")
                                .styledText(color: .white)
                                .foregroundStyle(Color.white)
                        }
                        .aspectRatio(contentMode: .fit)
                }))
        }
    }
}

