//
//  FavoriteJobsView.swift
//  FindJob
//
//  Created by Denis on 3/23/24.
//

//
//  JobCard.swift
//  FindJob
//
//  Created by Denis on 3/21/24.
//

import SwiftUI

struct FavoriteJobsCardView: View {
    @ObservedObject var viewModel: FavoriteViewModel
    
    var vacancy: Vacancy
    
    var body: some View {
            VStack(alignment: .leading) {
                HStack() {
                    if let persons = vacancy.lookingNumber {
                        Text("\(correctDeclination(countOfPersones: persons)) \(persons) человек")
                            .font(Resources.Fonts.text1)
                            .foregroundStyle(Resources.Colors.green)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.tapLikeButton(by: vacancy)
                    }) {
                        Image(vacancy.isFavorite ? .liked : .unliked)
                            .frame(width: 24, height: 24)
                    }
                }
                
                Text("\(vacancy.title)")
                    .font(Resources.Fonts.title3)
                    .foregroundStyle(Resources.Colors.white)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(vacancy.address.town)")
                        .font(Resources.Fonts.text1)
                        .foregroundStyle(Resources.Colors.white)
                    
                    HStack {
                        Text("\(vacancy.company)")
                            .font(Resources.Fonts.text1)
                            .foregroundStyle(Resources.Colors.white)
                        
                        Image(.approved)
                    }
                }
                .padding(.top, 5)
                
                HStack {
                    Image(.experience)
                    
                    Text("\(vacancy.experience.previewText)")
                        .font(Resources.Fonts.text1)
                        .foregroundStyle(Resources.Colors.white)
                }
                .padding(.top, 5)
                
                Text("Опубликовано \(vacancy.publishedDate.dateFormatter)")
                    .font(Resources.Fonts.text1)
                    .foregroundStyle(Resources.Colors.grey3)
                    .padding(.top, 5)
                
                Button(action: {
                    
                }) {
                    CustomButtonView(
                        font: Resources.Fonts.buttonText2,
                        fontColor: Resources.Colors.white,
                        title: "Откликнуться",
                        color: Resources.Colors.green,
                        padding: 7
                    )
                    .clipShape(Capsule())
                    .padding(.top, 8)
                }
            }
            .padding(
                EdgeInsets(
                    top: 10,
                    leading: 17,
                    bottom: 18,
                    trailing: 17
                )
            )
            .background(Resources.Colors.grey1)
    }
    
    private func correctDeclination(countOfPersones: Int) -> String {
        switch countOfPersones {
        case 1:
            return "Сейчас просматривает"
        case 11:
            return "Сейчас просматривают"
        default:
            if let last = countOfPersones.digits.last {
                if last == 1 {
                    return "Сейчас просматривает"
                } else {
                    return "Сейчас просматривают"
                }
            }
        }
        return ""
    }
}
