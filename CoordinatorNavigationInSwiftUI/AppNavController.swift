//
//  AppNavController.swift
//  CoordinatorNavigationInSwiftUI
//
//  Created by cefalo on 23/1/24.
//

import Foundation
import UIKit
import SwiftUI

public class CoordinatorAppNavigationController: UINavigationController, NavigationContext {
   
    public func setInitialView<T>(view: T) where T : View {
        let viewController = UIHostingController(rootView: view)
        viewControllers = [viewController]
    }
    
    public func push<T>(view: T, animated: Bool) where T : View {
        let viewController = UIHostingController(rootView: view)
        pushViewController(viewController, animated: animated)
    }
    
    public func pop(animated: Bool) {
        popViewController(animated: animated)
    }
    
    public func popToRoot(animated: Bool) {
        popToRootViewController(animated: animated)
    }
    
    public func present<T>(view: T, animated: Bool) where T : View {
        let viewController = UIHostingController(rootView: view)
        viewController.modalTransitionStyle = .coverVertical
        viewController.modalPresentationStyle = .automatic
        present(viewController, animated: animated)
    }
    
    public func dismiss(animated: Bool) {
        dismiss(animated: animated)
    }
}
