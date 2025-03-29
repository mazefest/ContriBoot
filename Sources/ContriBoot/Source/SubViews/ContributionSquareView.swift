//
//  ContributionSquareView.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/27/25.
//

import SwiftUI

public struct ContributionSquareView: View {
    public var color: Color = .green
    public var dimensions: (width: Double, height: Double) = (20.0, 20.0)
    public var cornerRadius: CGFloat = 3.0
    
    public init(
        color: Color,
        dimensions: (width: Double, height: Double) = (20.0, 20.0),
        cornerRadius: CGFloat = 3.0
    ) {
        self.color = color
        self.dimensions = dimensions
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        color
            .frame(width: dimensions.width, height: dimensions.height, alignment: .center)
            .cornerRadius(cornerRadius)
    }
}


#Preview {
    LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
        ForEach(0..<30) { _ in
            ContributionSquareView(color: .green.opacity(0.4))
            ContributionSquareView(color: .blue)
            ContributionSquareView(color: .yellow)
        }
    }
}
