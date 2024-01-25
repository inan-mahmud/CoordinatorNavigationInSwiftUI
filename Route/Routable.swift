//
//  Routable.swift
//  CoordinatorNavigationInSwiftUI
//
//  Created by cefalo on 24/1/24.
//

import SwiftUI

public enum NavigationType {
    case push
    case sheet
    case fullScreenCover
}

public protocol Routable: Hashable, Identifiable {
    associatedtype ViewType: View
    var navigationType: NavigationType { get }
    func viewToDisplay(router: Router<Self>) -> ViewType
}

extension Routable {
    public var id: Self { self }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
