//
//  ContributionSquareView.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/27/25.
//

import SwiftUI

struct ContributionSquareView: View {
    var color: Color
    var dimensions: (width: Double, height: Double) = (20.0, 20.0)
    var cornerRadius: CGFloat = 3.0
    var opacity: Double = 1.0
    
    init(color: Color, dimensions: (width: Double, height: Double) = (20.0, 20.0), cornerRadius: CGFloat = 3.0, opacity: Double) {
        self.color = color
        self.dimensions = dimensions
        self.cornerRadius = cornerRadius
        self.opacity = opacity
    }
    
    init(_ config: ContributionConfig) {
        switch config {
        case .noContributions:
            self.color = .gray
            self.opacity = 0.33
        case .contributions(let color, let contributions):
            self.color = color
            self.opacity = 1.0
        }
    }
    
    init(contributions: [Contributable], color: Color) {
        if contributions.count > 0 {
            self.init(.contributions(color: color, contributions: contributions))
        } else {
            self.init(.noContributions)
        }
    }
    
    var body: some View {
        color
            .frame(width: dimensions.width, height: dimensions.height, alignment: .center)
            .cornerRadius(cornerRadius)
            .opacity(opacity)
    }
}

enum ContributionConfig {
    case noContributions
    case contributions(color: Color, contributions: [Contributable])
}
