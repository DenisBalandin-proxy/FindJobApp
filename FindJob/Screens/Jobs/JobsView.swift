//
//  JobsView.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

struct JobsView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        ZStack {
            if !viewModel.vacancies.isEmpty {
                VStack {
                    SearchView()
                    
                    ScrollView {
                        RecommendationsView()
                        
                        HStack {
                            Text("")
                                .font(Resources.Fonts.title2)
                                .foregroundStyle(Resources.Colors.white)
                        }
                        
                        LazyVStack {
                            ForEach(filterVacancies(viewModel.vacancies).indices, id: \.self) { index in
                                JobCardView(viewModel: viewModel, vacancy: viewModel.vacancies[index])
                                    .onTapGesture {
                                        viewModel.pushToDetails(by: index)
                                    }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        }
                        
                        if viewModel.vacancies.count > 3 {
                            Button(action: {
                                
                            }) {
                                CustomButtonView(
                                    font: Resources.Fonts.buttonText2,
                                    fontColor: Resources.Colors.white,
                                    title: correctDeclination(countOfVacancies: viewModel.vacancies.count),
                                    color: .blue,
                                    padding: 11
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(EdgeInsets(top: 42, leading: 8, bottom: 8, trailing: 8))
                            }
                        }
                    }
                }
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .scaleEffect(2.0, anchor: .center)
            }
        }
        .onAppear(perform: {
            Task {
                if viewModel.state == .loading {
                    try await viewModel.fetchData()
                }
            }
        })
    }
    
    private func filterVacancies(_ vacancies: [Vacancy]) -> [Vacancy] {
        if vacancies.count >= 3 {
            return Array(vacancies.prefix(3))
        } else {
            return Array(vacancies.prefix(vacancies.count))
        }
    }
    
    private func correctDeclination(countOfVacancies: Int) -> String {
        let count = countOfVacancies - 3
        
        switch count {
        case 1:
            return "Еще \(count) вакансия"
        case 2...4:
            return "Еще \(count) вакансии"
        default:
            if let last = count.digits.last {
                switch last {
                case 1:
                    return "Еще \(count) вакансия"
                case 2...4:
                    return "Еще \(count) вакансии"
                default:
                    return "Еще \(count) вакансий"
                }
            }
        }
        return ""
    }
}

