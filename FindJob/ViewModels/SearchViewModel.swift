//
//  SearchViewModel.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI
import Combine

enum LoadingState {
    case loading
    case loaded
}

final class SearchViewModel: ObservableObject {
    private unowned let coordinator: JobsCoordinatorObject
    
    @Published var state: LoadingState = .loading
    @Published var vacancies: [Vacancy] = []
    
    private var db = DatabaseManager.shared
    private var anyCancellable: AnyCancellable? = nil
    
    init(coordinator: JobsCoordinatorObject) {
        self.coordinator = coordinator
        
        anyCancellable = db.objectWillChange.sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.objectWillChange.send()
                self?.updateData()
            }
        }
    }
    
    func fetchData() async throws {
        do {
            let fetched: Welcome = try await NetworkManager.shared.fetchData(from: URLs.api.rawValue)
            
            await MainActor.run {
                vacancies = fetched.vacancies
                state = .loaded
            }
            
            vacancies.filter {
                $0.isFavorite
            }.forEach({ vacancy in
                db.save(vacancy)
            })
        }
        catch {
            print("ERROR IN FETCHING")
        }
    }
    
    func pushToDetails(by index: Int) {
        coordinator.push(.job, with: index)
    }
    
    func pop(_ page: JobPage) {
        coordinator.pop(page)
    }
    
    func tapLikeButton(by vacancy: Vacancy) {
        if let index = vacancies.firstIndex(of: vacancy) {
            if vacancy.isFavorite {
                vacancies[index].isFavorite.toggle()
                db.remove(vacancy)
            } else {
                vacancies[index].isFavorite.toggle()
                db.save(vacancies[index])
            }
        }
    }
    
    private func updateData() {
        vacancies.filter { $0.isFavorite }.forEach({ vacancy in
            if !db.vacancies.contains(vacancy) {
                if let index = vacancies.firstIndex(of: vacancy) {
                    vacancies[index].isFavorite.toggle()
                }
            }
        })
    }
}
