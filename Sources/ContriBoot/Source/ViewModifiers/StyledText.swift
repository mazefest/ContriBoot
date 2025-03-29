//
//  StyledText.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/27/25.
//

import SwiftUI

struct StyledText: ViewModifier {
    var textStyle: Font.TextStyle
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(textStyle, design: .rounded, weight: .semibold))
            .foregroundStyle(color)
    }
}

extension View {
    func styledText(textStyle: Font.TextStyle = .body, color: Color = .black) -> some View {
        self.modifier(StyledText(textStyle: textStyle, color: color))
    }
}
