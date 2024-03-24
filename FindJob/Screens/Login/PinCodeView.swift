//
//  PinCodeView.swift
//  FindJob
//
//  Created by Denis on 3/20/24.
//

import SwiftUI

struct PinCodeView: View {
    @ObservedObject var viewModel: LoginViewModel
    @FocusState private var focusedField: Int?
    
    var eMail: String
    private var isValid: Bool {
        viewModel.pinCode.allSatisfy({ $0 != ""})
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Отправили код на \(eMail)")
                .font(Resources.Fonts.title2)
                .foregroundStyle(Resources.Colors.white)
            
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                .font(Resources.Fonts.title3)
                .foregroundStyle(Resources.Colors.white)
            
            HStack {
                ForEach(0..<viewModel.pinCode.count, id: \.self) { index in
                    TextField(
                        "",
                        text: $viewModel.pinCode[index],
                        prompt: Text("*")
                            .foregroundColor(Resources.Colors.grey3)
                            .font(Resources.Fonts.text2))
                    .frame(width: 42, height: 42)
                    .background(Resources.Colors.grey2)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .multilineTextAlignment(.center)
                    .focused($focusedField, equals: index)
                    .tag(index)
                    .keyboardType(.decimalPad)
                    .onChange(of: viewModel.pinCode[index]) {
                        processPin(index: index)
                    }
                }
            }
            
            Button(action: {
                auth()
            }) {
                CustomButtonView(
                    font: Resources.Fonts.buttonText2,
                    fontColor: Resources.Colors.white,
                    title: "Подтвердить",
                    color: .blue,
                    padding: 11
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top, 8)
            }
            .disabled(!isValid)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            focusedField = viewModel.pinCodeFocus
        })
    }
    
    private func processPin(index: Int) {
        if viewModel.pinCode[index].count > 1 {
            viewModel.pinCode[index] = String(viewModel.pinCode[index].suffix(1))
        }
        
        if viewModel.pinCode[index].isEmpty {
            focusedField = (focusedField ?? 0) - 1
            viewModel.pinCodeFocus = (focusedField ?? 0) - 1
        } else {
            if index == 3 {
                focusedField = nil
                viewModel.pinCodeFocus = 0
            } else {
                focusedField = (focusedField ?? 0) + 1
                viewModel.pinCodeFocus = (focusedField ?? 0) + 1
            }
        }
    }
    
    private func auth() {
        viewModel.loggeIn()
    }
}
