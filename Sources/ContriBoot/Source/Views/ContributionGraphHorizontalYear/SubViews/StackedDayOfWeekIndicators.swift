//
//  StackedDayOfWeekIndicators.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/27/25.
//

import SwiftUI

struct StackedDayOfWeekIndicators: View {
    var body: some View {
        VStack {
            ForEach(DayOfWeek.alldays(start: .sunday)) { dayOfWeek in
                Text(dayOfWeek.letter)
                    .styledText(color: .gray)
                    .opacity(0.8)
                    .frame(width: 20.0, height: 20.0)
            }
        }
    }
}
