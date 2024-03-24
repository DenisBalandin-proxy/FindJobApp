//
//  SearchView.swift
//  FindJob
//
//  Created by Denis on 3/20/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    
    var body: some View {
        HStack {
            TextFieldView(
                text: $searchText,
                icon: .search,
                placeholder: "Должность, ключевые слова"
            )
            
            Button(action: {
                
            }) {
                Image(.filter)
            }
        }
        .padding(EdgeInsets(top: 16, leading: 8, bottom: 0, trailing: 8))
    }
}
