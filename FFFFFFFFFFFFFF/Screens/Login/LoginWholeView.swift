//
//  LoginWholeView.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//

import SwiftUI

struct LoginWholeView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            LoginView(viewModel: viewModel)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
            
            StaffSearchView()
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
        }
    }
}
