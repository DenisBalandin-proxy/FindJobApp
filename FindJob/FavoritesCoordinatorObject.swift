//
//  FavoritesCoordinatorObject.swift
//  FindJob
//
//  Created by Denis on 3/23/24.
//

import SwiftUI

class FavoritesCoordinatorObject: ObservableObject {
    @Published var favoriteViewModel: FavoriteViewModel!
    
    init() {
        self.favoriteViewModel = FavoriteViewModel(coordinator: self)
    }
    
    @ViewBuilder
    func build() -> some View {
        FavoritesView(viewModel: favoriteViewModel)
    }
}
