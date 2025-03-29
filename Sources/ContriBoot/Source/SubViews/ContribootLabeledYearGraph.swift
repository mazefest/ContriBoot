//
//  ContribootYearGraphContent.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/29/25.
//

import SwiftUI

struct ContribootLabeledYearGraph: View {
    var items: [Contributable]
    var year: ContriBootYear
    var startOfWeek: DayOfWeek
    var contributions: [Int: [Contributable]] = [:]
    var contributeViewStyle: ContributeViewStyle
    
    init(
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
    
    var body: some View {
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
                        
                        ContribootHorizontalYearGraph(
                            items: items,
                            year: year,
                            startOfWeek: startOfWeek,
                            contributeViewStyle: contributeViewStyle
                        )

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

#Preview {
    ContribootLabeledYearGraph(items: Workout.generateTestWorkouts())
}
