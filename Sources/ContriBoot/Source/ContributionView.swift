//
//  ContributionView.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/27/25.
//

import SwiftUI

struct ContributionGraph: View {
    var dates: [Date]
    var color: Color
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 10), content: {
                ForEach(0..<40) { index in
                    contributionSquare(index: index)
                        .aspectRatio(contentMode: .fit)
                }
            })
        }
    }
    
    @ViewBuilder
    func contributionSquare(index: Int) -> some View {
        if dates.contains(where: {$0.isInDay(Date().changed(by: (index * -1), component: .day))}) {
            color
                .cornerRadius(3.0)
        } else {
            Color.gray
                .cornerRadius(3.0)
                .opacity(0.33)
        }
    }
}
