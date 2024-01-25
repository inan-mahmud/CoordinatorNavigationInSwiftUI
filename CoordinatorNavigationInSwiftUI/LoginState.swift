//
//  LoginState.swift
//  CoordinatorNavigationInSwiftUI
//
//  Created by cefalo on 23/1/24.
//

import Foundation

enum LoginState {
    case loggedIn
    case loggedOut
}

final class ViewState: ObservableObject {
    
    @Published var loginState: LoginState = .loggedOut
    
    
    func login() {
        loginState = .loggedIn
    }
    
    func logOut() {
        loginState = .loggedOut
    }
}



