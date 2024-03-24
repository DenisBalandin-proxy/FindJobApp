//
//  CoordinatoObject.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

enum CoordinatorTab {
    case search
    case favorite
}

class CoordinatorObject: ObservableObject {
    @Published var tab = CoordinatorTab.search
    
    @Published var searchCoordinator: JobsCoordinatorObject!
    @Published var favoritesCoordinator: FavoritesCoordinatorObject!
    @Published var db: DatabaseManager//+++++
    //@Published var searchViewModel: SearchViewModel!
    //@Published var favoriteViewModel: FavoriteViewModel!
    
    init() {
        searchCoordinator = JobsCoordinatorObject()
        favoritesCoordinator = FavoritesCoordinatorObject()
        db = DatabaseManager.shared
    }
    
    func switchToTabOne() {
        self.tab = .search
    }
}
