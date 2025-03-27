//
//  ContributionGraphHorizontalYear.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/27/25.
//

import SwiftUI

struct ContributionGraphHorizontalYear: View {
    var contributions: [Int: [Contributable]] = [:]
    var color: Color
    
    init(items: [Contributable], color: Color) {
        self.color = color
        
        items.forEach {
            let index = $0.date.indexOfDayInYear()
            contributions[index, default: []].append($0)
        }
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                StackedDayOfWeekIndicators()
                
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
                                        ForEach(0..<Date().beginningOffsetOfCurrentYear()) { i in
                                            ContributionSquareView(color: .gray, opacity: 0.13)
                                                .frame(width: 20.0, height: 20.0, alignment: .center)
                                        }
                                        
                                        ForEach(0..<Date().daysInYear()) { index in
                                            contributionSquare(index: index)
                                                .id(index)
                                        }
                                        
                                        ForEach(0..<Date().endOffsetOfCurrentYear()) { i in
                                            ContributionSquareView(color: .gray, opacity: 0.13)
                                                .frame(width: 20.0, height: 20.0, alignment: .center)
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
        ContributionSquareView(contributions: contributions[index] ?? [], color: .blue)
    }
}

#Preview {
    List {
        Section {
            ContributionGraphHorizontalYear(items: Workout.generateTestWorkouts(), color: .green)
        }
        
        Section {
            ContributionGraph(dates: Date.generateDates(in: Date().startOfYear()...Date().endOfYear()), color: .pink)
        }
    }
}
