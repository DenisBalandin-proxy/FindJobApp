//
//  FindJobApp.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

@main
struct FindJobApp: App {
    
    init() {
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = Resources.UIColors.black
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 20, weight: .semibold)
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 20, weight: .semibold)
        ]
        appearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = Resources.UIColors.black
        UITabBar.appearance().standardAppearance = tabBarAppearance

        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            CoordinatorTabBarView(object: CoordinatorObject())
                .environment(\.colorScheme, .dark)
        }
    }
}

