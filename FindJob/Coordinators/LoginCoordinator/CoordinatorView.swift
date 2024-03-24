//
//  CoordinatorView.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

struct CoordinatorView: View {
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .login)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }
        .environmentObject(coordinator)
    }
}
