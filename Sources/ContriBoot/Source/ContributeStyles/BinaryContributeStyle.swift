//
//  BinaryContributeStyle.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/29/25.
//

import SwiftUI

/**
 A style for contribution squares that uses binary coloring logic.

 This style will display `color` when the contribution `count` is greater than 0.
 If `count` is 0, it displays `absentColor`.

 - Parameters:
   - color: The color used when the count is greater than 0. Default is `.green`.
   - absentColor: The color used when the count is 0. Default is a semi-transparent gray.
   - cornerRadius: The corner radius of the square. Default is 3.0.

 - Method:
   - `color(for:)`: Returns the appropriate color based on the given count.
 */
struct BinaryContributeStyle: ContributeViewStyle {
    var color: Color = .green
    var absentColor: Color = .gray.opacity(0.33)
    var cornerRadius: CGFloat = 3.0

    func color(for count: Int) -> Color {
        count > 0 ? self.color : self.absentColor
    }
}
