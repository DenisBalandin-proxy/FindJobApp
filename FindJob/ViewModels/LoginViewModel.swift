//
//  LoginViewModel.swift
//  FindJob
//
//  Created by Denis on 3/24/24.
//

import Foundation

enum LoginStatus {
    case loggedOut
    case loggedIn
}

final class LoginViewModel: ObservableObject {
    private unowned let coordinator: Coordinator
    
    @Published var state: LoginStatus = .loggedOut
    @Published var login = ""
    @Published var isTapped = false
    @Published var emailWarning = false
    @Published var pinCode: [String] = Array(repeating: "", count: 4)
    @Published var pinCodeFocus = 0
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func push(_ page: Page, with eMail: String) {
        coordinator.push(page, with: eMail)
    }
    
    func loggeIn() {
        coordinator.isLogin = true
    }
}
