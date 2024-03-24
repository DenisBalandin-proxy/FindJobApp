//
//  Resources.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

enum Resources {
    enum Colors {
        static let black = Color(hex: "#000000")
        static let grey1 = Color(hex: "#222325")
        static let grey2 = Color(hex: "#313234")
        static let grey3 = Color(hex: "#858688")
        static let grey4 = Color(hex: "#9F9F9F")
        static let grey5 = Color(hex: "#DBDBDB")
        static let white = Color(hex: "#FFFFFF")
        
        static let darkBlue = Color(hex: "#00427D")
        static let green = Color(hex: "#4CB24E")
        static let darkGreen = Color(hex: "#015905")
        static let red = Color(hex: "#FF0000")
        
        static let shadows = Color(hex: "#0C0C0C")
    }
    
    enum UIColors {
        static let grey5 = UIColor(hex: "#DBDBDB")
        static let black = UIColor(hex: "#000000")
    }
    
    enum Fonts {
        static let title1 = customFont(with: 22, and: .semibold)
        static let title2 = customFont(with: 20, and: .semibold)
        static let title3 = customFont(with: 16, and: .medium)
        static let title4 = customFont(with: 14, and: .medium)
        
        static let text1 = customFont(with: 14, and: .regular)
        static let text2 = customFont(with: 24, and: .medium)
        
        static let buttonText1 = customFont(with: 16, and: .semibold)
        static let buttonText2 = customFont(with: 14, and: .regular)
        
        static let tabText = customFont(with: 10, and: .regular)
        
        static let number = customFont(with: 7, and: .regular)
        
        static func customFont(
            with size: CGFloat,
            and weight: Font.Weight
        ) -> Font {
            Font.system(size: size, weight: weight)
        }
    }
}
