//
//  JobsCoordinatorView.swift
//  FindJob
//
//  Created by Denis on 3/21/24.
//

import SwiftUI

struct JobsCoordinatorView: View {
    @ObservedObject var object: JobsCoordinatorObject
    
    var body: some View {
        NavigationStack(path: $object.path) {
            object.build(page: .jobs)
                .navigationDestination(for: JobPage.self) { page in
                    object.build(page: page)
                }
        }
    }
}
