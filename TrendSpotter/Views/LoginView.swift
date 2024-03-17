//
//  LoginView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-16.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        @StateObject var loginVM: LoginViewModel = LoginViewModel()
        ZStack{
            LinearGradient(colors: [Color("green"),Color.green.opacity(0.6)],startPoint: .bottomTrailing,endPoint: .topLeading).ignoresSafeArea()
            
            VStack{
                Text("Logo").bold().font(.system(size: 32)).foregroundStyle(.white)
                Spacer()
                RoundedRectangle(cornerRadius: 14).foregroundColor(.white).frame(height: 400).padding(30)
                    .overlay{
                        VStack(spacing:15) {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 0.5)
                                .frame(height:50).padding(.horizontal,48)
                                .overlay{
                                    HStack{
                                        Image(systemName: "person")
                                            .foregroundColor(.gray)
                                        TextField("Username",text:$loginVM.username)
                                    }.padding(.horizontal,56)
                                }
                            
                            
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 0.5)
                                .frame(height:50).padding(.horizontal,48)
                                .overlay{
                                    HStack{
                                        Image(systemName: "lock")
                                            .foregroundColor(.gray)
                                        SecureField("Password",text:$loginVM.password)
                                    }.padding(.horizontal,56)
                                    
                                }
                            Button(action:{
                                loginVM
                                .verifyLogin()}
                                   ,label: {
                                RoundedRectangle(cornerRadius: 25).frame(height:50).frame(width: 250)
                                    .padding(.horizontal,47)
                                    .padding(.top)
                                .foregroundColor(.green)})
                                        .overlay{
                                        Text("LOGIN").bold()
                                            .foregroundStyle(.white)
                                            .padding(.top)
                                    }
                        }
                        
                    }
                Spacer()
                if loginVM.showError {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 100).padding(40)
                        .foregroundColor(.white)
                        .shadow(radius : 10)
                        .overlay {
                            Text(loginVM.errorMessage)
                                .bold().foregroundStyle(.red)
                                .padding(48)
                        }
                }
            }
            NavigationLink("", isActive: $loginVM.success)
            {Text("Hello User")}
        }
        

    }
}

#Preview {
    LoginView()
}
