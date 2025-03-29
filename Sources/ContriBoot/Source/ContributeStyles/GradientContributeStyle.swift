//
//  GradientContributeStyle.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/29/25.
//

import SwiftUI

/**
 A style for contribution squares that uses a gradient opacity based on contribution intensity.

 This style dynamically adjusts the opacity of `color` depending on the `count` relative to the `highestCount`.
 If `count` is 0, it displays `absentColor`.

 - Parameters:
   - color: The base color used for non-zero contributions. Default is `.green`.
   - absentColor: The color used when the count is 0. Default is a semi-transparent gray.
   - cornerRadius: The corner radius of the square. Default is 3.0.

 - Method:
   - `color(for:highestCount:)`: Returns a color with an opacity proportional to the count's intensity.
 */
public struct GradientContributeStyle: ContributeViewStyle {
    public var color: Color
    public var absentColor: Color
    public var cornerRadius: CGFloat
    
    public init(color: Color = .green, absentColor: Color = .gray.opacity(0.33), cornerRadius: CGFloat = 3.0) {
        self.color = color
        self.absentColor = absentColor
        self.cornerRadius = cornerRadius
    }
    
    public func color(for count: Int, highestCount: Int) -> Color {
        guard count > 0 else { return absentColor }
        let percentage = Double(count) / Double(highestCount)
        let opacity = 0.1 + (0.9 * percentage)
        return color.opacity(opacity)
    }
}
