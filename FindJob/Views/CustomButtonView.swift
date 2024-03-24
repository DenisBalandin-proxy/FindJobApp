//
//  ButtonView.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

struct CustomButtonView: View {
    var font: Font
    var fontColor: Color
    var title: String
    var color: Color
    var padding: CGFloat
    
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
