//
//  LoginView.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Поиск работы")
                    .font(Resources.Fonts.title3)
                    .foregroundStyle(Resources.Colors.white)
                
                Spacer()
            }
            
            TextFieldView(
                text: $viewModel.login,
                icon: .responses,
                placeholder: "Электронная почта или телефон"
            )
            .onChange(of: viewModel.login, {
                withAnimation {
                    viewModel.emailWarning = false
                }
            })
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.red, lineWidth: viewModel.emailWarning ? 1 : 0)
            )
            
            if viewModel.emailWarning {
                HStack {
                    Text("Вы ввели неверный e-mail")
                        .font(Resources.Fonts.tabText)
                        .foregroundStyle(Resources.Colors.red)
                    
                    Spacer()
                }
            }
            
            HStack(spacing: 14) {
                Button(action: {
                    push()
                }) {
                    CustomButtonView(
                        font: Resources.Fonts.buttonText2,
                        fontColor:
                            viewModel.login.isEmpty
                        ? Resources.Colors.grey4
                        : Resources.Colors.white,
                        title: "Продолжить",
                        color:
                            viewModel.login.isEmpty
                        ? Resources.Colors.darkBlue
                        : .blue,
                        padding: 11
                    )
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .disabled(viewModel.login.isEmpty)
                
                Button("Войти с паролем") {
                    
                }
                .font(Resources.Fonts.buttonText2)
            }
            .padding(.trailing, 14)
        }
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
        .frame(maxWidth: .infinity)
        .background(Resources.Colors.grey1)
    }
    
    private func push() {
        if viewModel.login.isValidEmail {
            viewModel.push(.pinCode, with: viewModel.login)
        } else {
            withAnimation {
                viewModel.emailWarning = true
            }
        }
    }
}
