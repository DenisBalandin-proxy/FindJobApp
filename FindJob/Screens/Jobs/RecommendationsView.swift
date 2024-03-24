//
//  RecommendationsView.swift
//  FindJob
//
//  Created by Denis on 3/20/24.
//

import SwiftUI

struct RecommendationsData {
    let recImages: ImageResource
    let title: String
    let button: String?
}

struct RecommendationsView: View {
    private let data = [
        RecommendationsData(
            recImages: .recOne,
            title: "Вакансии рядом с вами",
            button: nil
        ),
        RecommendationsData(
            recImages: .recTwo,
            title: "Поднять резюме в поиске",
            button: "Поднять"
        ),
        RecommendationsData(
            recImages: .recThree,
            title: "Временная работа и подработка",
            button: nil
        )
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(0..<data.count, id: \.self) { index in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(data[index].recImages)
                                .padding(.leading, 8)
                            
                            Spacer()
                        }
                        .padding(.top, 11)
                        
                        Text(data[index].title)
                            .lineLimit(3)
                            .font(Resources.Fonts.text1)
                            .foregroundStyle(Resources.Colors.white)
                            .padding(
                                EdgeInsets(
                                    top: 8,
                                    leading: 8,
                                    bottom: 0,
                                    trailing: 8
                                )
                            )
                        
                        if let button = data[index].button {
                            Button(button) {
                                
                            }
                            .font(Resources.Fonts.text1)
                            .foregroundStyle(Resources.Colors.green)
                            .padding(.leading, 8)
                        }
                    }
                    .frame(width: 132, height: 120, alignment: .topLeading)
                    .background(Resources.Colors.grey2)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(
                EdgeInsets(
                    top: 33,
                    leading: 8,
                    bottom: 0,
                    trailing: 8
                )
            )
        }
        .scrollIndicators(.hidden)
    }
}
