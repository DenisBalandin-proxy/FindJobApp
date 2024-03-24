//
//  JobsCoordinatorObject.swift
//  FindJob
//
//  Created by Denis on 3/21/24.
//

import SwiftUI

enum JobPage: String, Identifiable {
    case jobs, job
    
    var id: String {
        self.rawValue
    }
}

class JobsCoordinatorObject: ObservableObject {
    @Published var path = NavigationPath()
    @Published var navTitle: [JobPage: String] = [:]
    @Published var viewModel: SearchViewModel!
    
    private var index: Int = 0
    
    init() {
        self.viewModel = SearchViewModel(coordinator: self)
    }
    
    func push(_ page: JobPage, with index: Int) {
        self.index = index
        path.append(page)
    }
    
    func pop(_ page: JobPage) {
        path.removeLast()
        navTitle.removeValue(forKey: page)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
        navTitle.removeAll()
    }
    
    @ViewBuilder
    func build(page: JobPage) -> some View {
        switch page {
        case .jobs:
            JobsView(viewModel: self.viewModel)
        case .job:
            DetailsView(viewModel: viewModel, index: index)
        }
    }
}
