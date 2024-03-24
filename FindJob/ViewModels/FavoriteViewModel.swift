//
//  FavoriteViewModel.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//
import SwiftUI
import Combine

enum FavoritesLoadingState {
    case loading
    case loaded
}

final class FavoriteViewModel: ObservableObject {
    private unowned let coordinator: FavoritesCoordinatorObject
    
    @Published var vacancies: [Vacancy] = []

    private var db = DatabaseManager.shared
    private var anyCancellable: AnyCancellable? = nil
    
    init(coordinator: FavoritesCoordinatorObject) {
        self.coordinator = coordinator
        
        anyCancellable = db.objectWillChange.sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.objectWillChange.send()
                self?.update()
            }
        }
    }

    func fetchFromDB() {
        vacancies = db.vacancies
    }
    
    func tapLikeButton(by vacancy: Vacancy) {
        vacancies.removeAll { $0 == vacancy}
        db.remove(vacancy)
    }
    
    private func update() {
        vacancies = db.vacancies
    }
}
