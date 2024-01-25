//
//  NavigationContext.swift
//  CoordinatorNavigationInSwiftUI
//
//  Created by cefalo on 23/1/24.
//

import Foundation
import SwiftUI

public protocol NavigationContext {
    func setInitialView<T: View>(view: T)
    func push<T: View>(view:T, animated: Bool)
    func pop(animated: Bool)
    func popToRoot(animated: Bool)
    func present<T: View>(view: T, animated: Bool)
    func dismiss(animated: Bool)
}
