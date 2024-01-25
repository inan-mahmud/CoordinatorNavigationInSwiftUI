//
//  MainCoordinator.swift
//  CoordinatorNavigationInSwiftUI
//
//  Created by cefalo on 23/1/24.
//

import Foundation
import SwiftUI

public class MainCoordinator: Coordinator {
    
    let navigationContext: NavigationContext
    
    
    init(navigationContext: NavigationContext) {
        self.navigationContext = navigationContext
    }
    
    func navigate() {
//        switch viewState.loginState {
//            case .loggedIn:
//                navigationContext.setInitialView(view: DashboardView())
//            case .loggedOut:
//                navigationContext.setInitialView(view: LoginView())
//        }
    }
}
