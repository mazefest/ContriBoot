//
//  CustomContributeStyle.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/29/25.
//


import SwiftUI

/**
 A customizable contribution style that allows injecting a fully custom SwiftUI view.

 This style lets you define how a group of `Contributable` items should be displayed
 by supplying a custom view builder function.

 - Parameter:
   - customView: A closure that takes an array of `Contributable` items and returns a custom view conforming to `View`.

 - Usage:
   Use this style when you need complete control over the appearance of the contribution view.
 */
public struct CustomContributeStyle: ContributeViewStyle {
    public var customView : ([Contributable]) -> any View
    
    public init(_ customView: @escaping ([Contributable]) -> any View) {
        self.customView = customView
    }
}
