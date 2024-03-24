//
//  FavoritesCoordinatorView.swift
//  FindJob
//
//  Created by Denis on 3/23/24.
//

import SwiftUI

struct FavoritesCoordinatorView: View {
    @ObservedObject var object: FavoritesCoordinatorObject
    
    var body: some View {
        object.build()
    }
}
