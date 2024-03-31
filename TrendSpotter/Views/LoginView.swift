//
//  LoginView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-16.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginVM: LoginViewModel = LoginViewModel()
    let productID: String
        @ObservedObject var viewModel: ProductViewModel
        
        init(productID: String) {
            self.productID = productID
            self.viewModel = ProductViewModel()
            viewModel.fetchProductDetails(for: productID)
        }

    var body: some View {
        VStack {
            Text("Welcome Back")
                .font(.title)
                .bold()
                .offset(y: 50)

            RoundedRectangle(cornerRadius: 14)
                .foregroundColor(.white)
                .frame(height: 400)
                .padding(30)
                .overlay {
                    VStack(spacing: 15) {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 0.5)
                            .frame(height: 50)
                            .padding(.horizontal, 48)
                            .overlay {
                                HStack {
                                    Image(systemName: "person")
                                        .foregroundColor(.gray)
                                    TextField("Username", text: $loginVM.username)
                                }
                                .padding(.horizontal, 56)
                            }

                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 0.5)
                            .frame(height: 50)
                            .padding(.horizontal, 48)
                            .overlay {
                                HStack {
                                    Image(systemName: "lock")
                                        .foregroundColor(.gray)
                                    SecureField("Password", text: $loginVM.password)
                                }
                                .padding(.horizontal, 56)
                            }

                        Text("Forgot Password?")
                            .font(.system(size: 11))
                            .offset(x: 90, y: -10)

                        Button(action: {
                            loginVM.verifyLogin()
                        }) {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(height: 50)
                                .padding(.horizontal, 47)
                                .padding(.top)
                                .foregroundColor(.green)
                        }
                        .overlay {
                            Text("LOGIN")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top)
                        }
                        .offset(y: -30)
                    }
                }

            Spacer()

            if loginVM.showError {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 100)
                    .padding(40)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .overlay {
                        Text(loginVM.errorMessage)
                            .bold()
                            .foregroundColor(.red)
                            .padding(48)
                    }
            }

            HStack {
                Text("Not a member?")
                Button(action: {
                    loginVM.navigateToSignup = true // Navigate to the signup page
                }) {
                    Text("Join Now")
                        .foregroundColor(.blue)
                }
            }
        }.navigationBarBackButtonHidden(true)
        

        NavigationLink(destination: SignupView(), isActive: $loginVM.navigateToSignup) {
            EmptyView()
        }
        
    }
}


#Preview {
    LoginView(productID: "")
}
