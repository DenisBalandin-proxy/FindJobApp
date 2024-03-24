//
//  TextViewl.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    
    let icon: ImageResource
    let placeholder: String
    private let cross: ImageResource = .cross
    
    var body: some View {
        HStack {
            if text.isEmpty {
                Image(icon).renderingMode(.template)
                    .foregroundStyle(Resources.Colors.grey4)
            }
            
            TextField(
                "",
                text: $text,
                prompt: Text(placeholder)
                    .foregroundColor(Resources.Colors.grey4)
                    .font(Resources.Fonts.text1)
            )
            .font(Resources.Fonts.text1)
            
            if !text.isEmpty {
                Image(cross).renderingMode(.template)
                    .foregroundStyle(Resources.Colors.white)
                    .onTapGesture {
                        text = ""
                    }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .frame(maxHeight: 40)
        .background(Resources.Colors.grey2)
        .foregroundStyle(Resources.Colors.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
