////
////  SceneDelegate.swift
////  CoordinatorNavigationInSwiftUI
////
////  Created by cefalo on 23/1/24.
////
//
//import Foundation
//import SwiftUI
//
//final class SceneDelegate: NSObject, UIWindowSceneDelegate {
//    
//    private var coordinator: Coordinator?
//    var window: UIWindow?
//    
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        
//        let navigationContext = CoordinatorAppNavigationController()
//        coordinator = MainCoordinator(navigationContext: navigationContext)
//        window = UIWindow(windowScene: windowScene)
//        window?.rootViewController = navigationContext
//        window?.makeKeyAndVisible()
//        coordinator?.navigate()
//    }
//}
