//
//  ButtonView.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

struct CustomButtonView: View {
    let font: Font
    let fontColor: Color
    let title: String
    let color: Color
    let padding: CGFloat
    
    var body: some View {
        HStack {
            Text(title)
        }
        .font(font)
        .frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: padding, leading: 0, bottom: padding, trailing: 0))
        .background(color)
        .foregroundStyle(fontColor)
    }
}
