//
//  ContributionGraphHorizontalYear.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/27/25.
//

import SwiftUI

struct ContributionGraphHorizontalYear: View {
    var year: ContribootYear
    var startOfWeek: DayOfWeek
    var contributions: [Int: [Contributable]] = [:]
    
    // for drawing items
    let daysInYear: Int
    let beginningOffsetOfCurrentYear: Int
    let endOffsetOfCurrentYear: Int
    
    // for contribute
    var contributeViewStyle: ContributeViewStyle = BinaryContributeStyle()
    var highestCount: Int = 0
    
    init(
        items: [Contributable],
        year: ContribootYear = .currentYear,
        startOfWeek: DayOfWeek = .sunday
    ) {
        self.year = year
        self.startOfWeek = startOfWeek
        self.daysInYear = year.daysInYear
        self.beginningOffsetOfCurrentYear = year.date.beginningOffsetOfCurrentYear(startOfWeek: startOfWeek)
        self.endOffsetOfCurrentYear = year.date.endOffsetOfCurrentYear(startOfWeek: startOfWeek)
        
        items.forEach {
            let index = $0.date.indexOfDayInYear()
            contributions[index, default: []].append($0)
        }
        
        highestCount = contributions.values.max(by: { $0.count < $1.count })?.count ?? 0
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                StackedDayOfWeekIndicators(startOfWeek: startOfWeek)
                
                ScrollViewReader(content: { proxy in
                    VStack {
                        ScrollView(.horizontal) {
                            VStack {
                                HStack {
                                    ForEach(Month.allCases, id: \.self) { month in
                                        Spacer()
                                        Text(month.shortTitle)
                                            .styledText(color: .gray)
                                            .opacity(0.33)
                                        Spacer()
                                    }
                                }
                                
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
                        }
                        .scrollIndicators(.hidden)
                        .onAppear {
                            let id = Date().indexOfDayInYear()
                            proxy.scrollTo(id)
                        }
                    }
                })
            }
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


extension ContributionGraphHorizontalYear {
    func contributeStyle(_ contributionStyle: ContributeViewStyle) -> ContributionGraphHorizontalYear {
        var copy = self
        copy.contributeViewStyle = contributionStyle
        return copy
    }
}


#Preview {
    List {
        Section("Gradient") {
            ContributionGraphHorizontalYear(items: Workout.generateTestWorkouts())
                .contributeStyle(GradientContributeStyle())
        }
        
        Section("Gradient: Blue") {
            ContributionGraphHorizontalYear(items: Workout.generateTestWorkouts())
                .contributeStyle(GradientContributeStyle(color: .blue))
        }
            
        Section("Gradient: Pink") {
            ContributionGraphHorizontalYear(items: Workout.generateTestWorkouts())
                .contributeStyle(GradientContributeStyle(color: .pink))
        }
        
        Section("Binary") {
            ContributionGraphHorizontalYear(items: Workout.generateTestWorkouts())
                .contributeStyle(BinaryContributeStyle())
        }
            
        Section("Binary: Blue") {
            ContributionGraphHorizontalYear(items: Workout.generateTestWorkouts())
                .contributeStyle(BinaryContributeStyle(color: .blue))
        }
        
        Section("Binary: Pink") {
            ContributionGraphHorizontalYear(items: Workout.generateTestWorkouts())
                .contributeStyle(BinaryContributeStyle(color: .pink))
        }

        Section("Custom") {
            ContributionGraphHorizontalYear(items: Workout.generateTestWorkouts())
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

