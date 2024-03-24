//
//  StaffSearchView.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

struct StaffSearchView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Поиск сотрудников")
                    .font(Resources.Fonts.title3)
                    .foregroundStyle(Resources.Colors.white)
                
                Spacer()
            }
            
            Text("Размещение вакансии и доступ к базе резюме")
                .font(Resources.Fonts.text1)
                .foregroundStyle(Resources.Colors.white)
            
            Button(action: {
                print("ffff")
            }) {
                CustomButtonView(
                    font: Resources.Fonts.buttonText2,
                    fontColor: Resources.Colors.white,
                    title: "Я ищу сотрудников",
                    color: Resources.Colors.green,
                    padding: 7
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top, 8)
            }
            
        }
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
        .frame(maxWidth: .infinity)
        .background(Resources.Colors.grey1)
    }
}
