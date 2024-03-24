//
//  DetailsView.swift
//  FindJob
//
//  Created by Denis on 3/21/24.
//

import SwiftUI

struct DetailsView: View {
    //var viewModel: SearchViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("UI/UX Designer")
                .font(Resources.Fonts.title1)
                .foregroundStyle(Resources.Colors.white)
            
            Text("Уровень дохода")
                .font(Resources.Fonts.text1)
                .foregroundStyle(Resources.Colors.white)
                .padding(.top, 4)
            
            Text("дохода")
                .font(Resources.Fonts.text1)
                .foregroundStyle(Resources.Colors.white)
                .padding(.top, 4)
            
            Text("дохода")
                .font(Resources.Fonts.text1)
                .foregroundStyle(Resources.Colors.white)
        }
        .frame(maxWidth: .infinity)
        .background(.black)
    }
}

#Preview {
    DetailsView()
}
