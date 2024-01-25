//
//  LoginView.swift
//  CoordinatorNavigationInSwiftUI
//
//  Created by cefalo on 23/1/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginState: ViewState = ViewState()
    
    
    var body: some View {
        Button("Login") {
            loginState.login()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginState: ViewState())
    }
}
