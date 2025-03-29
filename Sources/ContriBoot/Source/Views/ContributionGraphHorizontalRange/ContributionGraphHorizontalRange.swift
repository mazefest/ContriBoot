//
//  ContributionGraphHorizontalYear 2.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/28/25.
//

import SwiftUI

//struct ContributionGraphHorizontalRange: View {
//    var contributions: [Int: [Contributable]] = [:]
//    var color: Color
//    
//    let daysInYear: Int
//    let beginningOffsetOfCurrentYear: Int
//    let endOffsetOfCurrentYear: Int
//    
//    init(items: [Contributable], color: Color) {
//        self.color = color
//        
//        self.daysInYear = Date().daysInYear()
//        self.beginningOffsetOfCurrentYear = Date().beginningOffsetOfCurrentYear()
//        self.endOffsetOfCurrentYear = Date().endOffsetOfCurrentYear()
//        
//        items.forEach {
//            let index = $0.date.indexOfDayInYear()
//            contributions[index, default: []].append($0)
//        }
//    }
//    
//    var body: some View {
//        VStack {
//            HStack(alignment: .bottom) {
//                StackedDayOfWeekIndicators()
//                
//                ScrollViewReader(content: { proxy in
//                    VStack {
//                        ScrollView(.horizontal) {
//                            VStack {
//                                HStack {
//                                    ForEach(Month.allCases, id: \.self) { month in
//                                        Spacer()
//                                        Text(month.shortTitle)
//                                            .styledText(color: .gray)
//                                            .opacity(0.33)
//                                        Spacer()
//                                    }
//                                }
//                                
//                                HStack {
//                                    LazyHGrid(rows: Array(repeating: GridItem(.fixed(20.0)), count: 7), content: {
//                                        ForEach(0..<beginningOffsetOfCurrentYear, id: \.self) { i in
//                                            ContributionSquareView(color: .gray, opacity: 0.13)
//                                                .frame(width: 20.0, height: 20.0, alignment: .center)
//                                        }
//                                        
//                                        ForEach(0..<daysInYear, id: \.self) { index in
//                                            contributionSquare(index: index)
//                                                .id(index)
//                                        }
//                                        
//                                        ForEach(0..<endOffsetOfCurrentYear, id: \.self) { i in
//                                            ContributionSquareView(color: .gray, opacity: 0.13)
//                                                .frame(width: 20.0, height: 20.0, alignment: .center)
//                                        }
//                                    })
//                                }
//                            }
//                        }
//                        .scrollIndicators(.hidden)
//                        .onAppear {
//                            let id = Date().indexOfDayInYear()
//                            proxy.scrollTo(id)
//                        }
//                    }
//                })
//            }
//        }
//    }
//
//}
//
//#Preview {
//    List {
//        Section {
//            ContributionGraphHorizontalRange(items: Workout.generateTestWorkouts(), color: .green)
//        }
//        
//        Section {
//            ContributionGraph(dates: Date.generateDates(in: Date().startOfYear()...Date().endOfYear()), color: .pink)
//        }
//    }
//}
