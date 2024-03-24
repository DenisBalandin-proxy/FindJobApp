//
//  Coordinator.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

enum Page: String, Identifiable {
    case login, pinCode
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var eMail: String = ""
    @Published var navTitle: [Page: String] = [:]
    @Published var viewModel: LoginViewModel!
    @Published var isLogin: Bool?
    
    init() {
        viewModel = LoginViewModel(coordinator: self)
    }
    
    func push(_ page: Page, with eMail: String) {
        path.append(page)
        self.eMail = eMail
    }
    
    func pop(_ page: Page) {
        path.removeLast()
        navTitle.removeValue(forKey: page)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
        navTitle.removeAll()
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .login:
            LoginWholeView(viewModel: viewModel)
        case .pinCode:
            PinCodeView(viewModel: viewModel, eMail: eMail)
        }
    }
}
