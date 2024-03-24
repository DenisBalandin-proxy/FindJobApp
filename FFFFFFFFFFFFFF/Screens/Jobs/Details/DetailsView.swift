//
//  DetailsView.swift
//  FindJob
//
//  Created by Denis on 3/21/24.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    let index: Int
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HeaderView(
                    data: JobHeaderEntity(
                        title: viewModel.vacancies[index].title,
                        salary: viewModel.vacancies[index].salary,
                        experience: viewModel.vacancies[index].experience,
                        schedules: viewModel.vacancies[index].schedules
                    )
                )
                
                if let appliedNumber = viewModel.vacancies[index].appliedNumber {
                    Responses(
                        response: ResponseEntity(
                            appliedNumber: appliedNumber,
                            lookingNumber: viewModel.vacancies[index].lookingNumber
                        )
                    )
                    .padding(.top, 19)
                }
                
                MapView(
                    data: MapEntity(
                        company: viewModel.vacancies[index].company,
                        adress: Address(
                            town: viewModel.vacancies[index].address.town,
                            street: viewModel.vacancies[index].address.street,
                            house: viewModel.vacancies[index].address.house
                        )
                    )
                )
                .padding(.top, 12)
                
                if let description = viewModel.vacancies[index].description {
                    Text("\(description)")
                        .font(Resources.Fonts.text1)
                        .foregroundStyle(Resources.Colors.white)
                        .padding(.top, 6)
                }
                
                Text("Ваши задачи")
                    .font(Resources.Fonts.title2)
                    .foregroundStyle(Resources.Colors.white)
                    .padding(.top, 6)
                
                Text("\(viewModel.vacancies[index].responsibilities)")
                    .font(Resources.Fonts.text1)
                    .foregroundStyle(Resources.Colors.white)
                
                Text("Задайте вопрос работодателю")
                    .font(Resources.Fonts.title4)
                    .foregroundStyle(Resources.Colors.white)
                    .padding(.top, 12)
                
                Text("Он получит его с откликом на вакансию")
                    .font(Resources.Fonts.title4)
                    .foregroundStyle(Resources.Colors.grey3)
                
                VStack(alignment: .leading) {
                    ForEach(viewModel.vacancies[index].questions, id: \.self) { question in
                        Text(question)
                            .padding(EdgeInsets(top: 6, leading: 4, bottom: 6, trailing: 4))
                            .background(Resources.Colors.grey2)
                            .foregroundStyle(Resources.Colors.white)
                            .font(Resources.Fonts.title4)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                
                Button(action: {
                    
                }) {
                    CustomButtonView(
                        font: Resources.Fonts.buttonText2,
                        fontColor: Resources.Colors.white,
                        title: "Откликнуться",
                        color: Resources.Colors.green,
                        padding: 11
                    )
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 8))
            .frame(maxWidth: .infinity)
            .background(.black)
        }
        .toolbarBackground(
            Color.black,
            for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    viewModel.pop(.job)
                }) {
                    Image(.arrowBack)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(.eye)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(.share)
                    }
                    
                    Button(action: {
                        viewModel.tapLikeButton(by: viewModel.vacancies[index])
                    }) {
                        Image(viewModel.vacancies[index].isFavorite ? .liked : .unliked)
                    }
                }
            }
        }
    }
}

