//
//  Header.swift
//  FindJob
//
//  Created by Denis on 3/21/24.
//

import SwiftUI

struct HeaderView: View {
    let data: JobHeaderEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(data.title)")
                .font(Resources.Fonts.title1)
                .foregroundStyle(Resources.Colors.white)
            
            Text("\(data.salary.full)")
                .font(Resources.Fonts.text1)
                .foregroundStyle(Resources.Colors.white)
                .padding(.top, 4)
            
            Text("Требуемый опыт: \(data.experience.text)")
                .font(Resources.Fonts.text1)
                .foregroundStyle(Resources.Colors.white)
                .padding(.top, 4)
            
            Text("\(prepareSchedules(data.schedules))")
                .font(Resources.Fonts.text1)
                .foregroundStyle(Resources.Colors.white)
        }
    }
    
    private func prepareSchedules(_ strings: [String]) -> String {
        strings.joined(separator: ", ").capitalizingFirstLetter()
    }
}
