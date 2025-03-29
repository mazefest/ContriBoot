//
//  StackedDayOfWeekIndicators.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/27/25.
//

import SwiftUI

struct StackedDayOfWeekIndicators: View {
    var startOfWeek: DayOfWeek
    
    var body: some View {
        VStack {
            ForEach(DayOfWeek.alldays(start: startOfWeek)) { dayOfWeek in
                Text(dayOfWeek.letter)
                    .styledText(color: .gray)
                    .opacity(0.8)
                    .frame(width: 20.0, height: 20.0)
            }
        }
    }
}

#Preview {
    HStack {
        ForEach(DayOfWeek.alldays(start: .monday)) { startOfWeek in
            StackedDayOfWeekIndicators(startOfWeek: startOfWeek)
        }
    }
}
