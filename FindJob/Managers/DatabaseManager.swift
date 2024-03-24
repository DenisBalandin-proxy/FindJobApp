//
//  DatabaseManager.swift
//  FindJob
//
//  Created by Denis on 3/23/24.
//

import Foundation

final class DatabaseManager: ObservableObject {
    static let shared = DatabaseManager()
    
    @Published var vacancies: [Vacancy] = []
    
    private init() {}
    
    func save(_ vacancy: Vacancy) {
        DispatchQueue.main.async {
            self.vacancies.append(vacancy)
        }
    }
    
    func remove(_ vacancy: Vacancy) {
        DispatchQueue.main.async {
            self.vacancies.removeAll { $0 == vacancy }
        }
    }
    
    func receiveAll() -> [Vacancy] {
        vacancies
    }
    
    func tapLikeButton(by vacancy: Vacancy) {
        guard let index = vacancies.firstIndex(of: vacancy) else {
            return
        }
        DispatchQueue.main.async {
            self.vacancies[index].isFavorite.toggle()
        }
    }
}
