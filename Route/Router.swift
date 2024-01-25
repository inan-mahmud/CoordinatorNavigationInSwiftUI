//
//  Router.swift
//  CoordinatorNavigationInSwiftUI
//
//  Created by cefalo on 24/1/24.
//

import Foundation
import SwiftUI

public class Router<Destination: Routable>: ObservableObject {
    
    @Published public var path: NavigationPath = NavigationPath()
    
    @Published public var presentingSheet: Destination?
    
    @Published public var presentingFullScreenCover: Destination?
    
    @Published public var isPresented: Binding<Destination?>
    
    public var isPresenting: Bool {
        presentingSheet != nil || presentingFullScreenCover != nil
    }
    
    init(isPresented: Binding<Destination?>){
        self.isPresented = isPresented
    }
    
    @ViewBuilder public func view(for route: Destination) -> some View {
        route.viewToDisplay(router: router(routeType: route.navigationType))
    }
    
    public func routeTo(_ route: Destination) {
        switch route.navigationType {
        case .push:
            push(route)
        case .sheet:
            presentSheet(route)
        case .fullScreenCover:
            presentFullScreen(route)
        }
    }
    
    public func popToRoot() {
            path.removeLast(path.count)
        }
        
    public func dismiss() {
            if !path.isEmpty {
                path.removeLast()
            } else if presentingSheet != nil {
                presentingSheet = nil
            } else if presentingFullScreenCover != nil {
                presentingFullScreenCover = nil
            } else {
                isPresented.wrappedValue = nil
            }
        }
        
    private func push(_ appRoute: Destination) {
            path.append(appRoute)
        }
        
    private func presentSheet(_ route: Destination) {
            self.presentingSheet = route
        }
        
    private func presentFullScreen(_ route: Destination) {
            self.presentingFullScreenCover = route
        }
    
    private func router(routeType: NavigationType) -> Router {
            switch routeType {
            case .push:
                return self
            case .sheet:
                return Router(
                    isPresented: Binding(
                        get: { self.presentingSheet },
                        set: { self.presentingSheet = $0 }
                    )
                )
            case .fullScreenCover:
                return Router(
                    isPresented: Binding(
                        get: { self.presentingFullScreenCover },
                        set: { self.presentingFullScreenCover = $0 }
                    )
                )
            }
        }
}
