//
//  CoordinatoObject.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI
import Combine

enum CoordinatorTab {
    case search
    case favorite
    case responses
    case messages
    case profile
}

class CoordinatorObject: ObservableObject {
    @Published var tab = CoordinatorTab.search
    
    @Published var searchCoordinator: JobsCoordinatorObject!
    @Published var favoritesCoordinator: FavoritesCoordinatorObject!
    @Published var loginCoordinator: Coordinator!
    
    @Published var isLogin: Bool?
    @Published var favorites = 0
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        searchCoordinator = JobsCoordinatorObject()
        favoritesCoordinator = FavoritesCoordinatorObject()
        loginCoordinator = Coordinator()
        
        loginCoordinator.objectWillChange.sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.objectWillChange.send()
                self?.isLogin = self?.loginCoordinator.isLogin
            }
        }.store(in: &bag)
        
        favoritesCoordinator.favoriteViewModel.objectWillChange.sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.objectWillChange.send()
                self?.favorites = self?.favoritesCoordinator.favoriteViewModel.vacancies.count ?? 0
            }
        }.store(in: &bag)
    }
}
