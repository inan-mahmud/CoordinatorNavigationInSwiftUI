//
//  Coordinator.swift
//  CoordinatorNavigationInSwiftUI
//
//  Created by cefalo on 23/1/24.
//

import Foundation
import UIKit

enum Route {
    case dashboard
    case login
}


protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    
    func start(animated: Bool)
    
    func popViewController(animated: Bool)
    
}

extension Coordinator {
    
    func popViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = navigationController.viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            navigationController.popToViewController(vc, animated: animated)
        }
    }
    
    func popViewController(to viewController: UIViewController, animated: Bool) {
        navigationController.popToViewController(viewController, animated: animated)
    }
}


protocol ParentCoordinator: Coordinator {
    var childCoordinators: [Coordinator] { get set }
    
    func addChildCoordinator(_ child: Coordinator?)
    
    func childDidFinish(_ child: Coordinator?)
}

extension ParentCoordinator {
    
    func addChildCoordinator(_ child: Coordinator?) {
        if let child {
            childCoordinators.append(child)
        }
    }
    
    func childDidFinish(_ child: Coordinator?) {
        if let index = childCoordinators.firstIndex(where: { $0 === child }) {
                    childCoordinators.remove(at: index)
        }
    }
}

protocol ChildCoordinator: Coordinator {
    
    func coordinatorDidFinish()
    
    var viewController: UIViewController? { get set }
}


final class RootCoordinator: NSObject, ParentCoordinator {
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        
    }
    
    func onLogInFinish() {
        
    }
}

extension RootCoordinator {
    
    func navigateToDashboard() {
        
    }
    
    func navigateToLogin() {
        
    }
}

final class LoginCoordinator: ChildCoordinator {
    var parent: RootCoordinator?
    
    var viewController: UIViewController?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        
    }
    
    func onLoginSuccess() {
        coordinatorDidFinish()
        parent?.onLogInFinish()
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}

extension LoginCoordinator {
    
}

final class HomeTabCoordinator: ChildCoordinator {
    var parent: RootCoordinator?
    var viewController: UIViewController?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}


final class SettingsTabCoordinator: ChildCoordinator {
    
    var parent: RootCoordinator?
    var viewController: UIViewController?
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: inject ViewModel with coordinator and attach it to view controller
    func start(animated: Bool) {
        
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
    
   
}
