//
//  Responses.swift
//  FindJob
//
//  Created by Denis on 3/21/24.
//

import SwiftUI

struct Responses: View {
    let response: ResponseEntity
    
    var body: some View {
        HStack {
            if let appliedNumber = response.appliedNumber {
                HStack(alignment: .top) {
                    Text("\(appliedNumber) \(correctDeclination(countOfPersones: appliedNumber))")
                        .font(Resources.Fonts.text1)
                        .foregroundStyle(Resources.Colors.white)
                        .lineLimit(2)
                        .padding(.all, 8)
                    
                    Spacer()
                    
                    Image(.responsesJob)
                        .padding(.all, 8)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Resources.Colors.darkGreen)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
            }
            if let lookingNumber = response.lookingNumber {
                HStack(alignment: .top) {
                    Text("\(lookingNumber) \(correctDeclinationWatching(countOfPersones: lookingNumber))")
                        .font(Resources.Fonts.text1)
                        .foregroundStyle(Resources.Colors.white)
                        .lineLimit(2)
                        .padding(.all, 8)
                    
                    Spacer()
                    
                    Image(.watching)
                        .padding(.all, 8)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Resources.Colors.darkGreen)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
    
    private func correctDeclination(countOfPersones: Int) -> String {
        switch countOfPersones {
        case 1:
            return "человек уже откликнулся"
        case 2...4:
            return "человека уже откликнулось"
        case 11...20:
            return "человек уже откликнулось"
        default:
            if let last = countOfPersones.digits.last {
                if last == 1 && countOfPersones != 11 {
                    return "человек уже откликнулся"
                } else {
                    return "человек уже откликнулось"
                }
            }
        }
        return ""
    }
    
    private func correctDeclinationWatching(countOfPersones: Int) -> String {
        switch countOfPersones {
        case 1:
            return "человек сейчас смотрит"
        case 2...4:
            return "человека сейчас смотрят"
        case 11...20:
            return "человек сейчас смотрят"
        default:
            if let last = countOfPersones.digits.last {
                if last == 1 && countOfPersones != 11 {
                    return "человек сейчас смотрит"
                } else {
                    return "человек сейчас смотрят"
                }
            }
        }
        return ""
    }
}
