//
//  FavoritesView.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: FavoriteViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Text("\(correctDeclination(countOfPersones: viewModel.vacancies.count))")
                        .foregroundStyle(Resources.Colors.grey3)
                        .font(Resources.Fonts.text1)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    
                    Spacer()
                }
                LazyVStack {
                    ForEach(viewModel.vacancies) { data in
                        FavoriteJobsCardView(
                            viewModel: viewModel,
                            vacancy: data
                        )
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                }
            }
            .navigationTitle("Избранное")
        }
        .onAppear(perform: {
            viewModel.fetchFromDB()
        })
    }
    
    private func correctDeclination(countOfPersones: Int) -> String {
        switch countOfPersones {
        case 1:
            return "\(countOfPersones) вакансия"
        case 2...4:
            return "\(countOfPersones) вакансии"
        case 11:
            return "\(countOfPersones) вакансий"
        default:
            if let last = countOfPersones.digits.last {
                if last == 1 {
                    return "\(countOfPersones) вакансия"
                } else {
                    return "\(countOfPersones) вакансии"
                }
            }
        }
        return ""
    }
}
