//
//  SignupView.swift
//  TrendSpotter
//
//  Created by NIBMPC04PC03 on 2024-03-29.
//

import SwiftUI

struct SignupView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var email = ""
    var body: some View {
        VStack{
            Text("Sign Up").bold().offset(x:-90).font(.system(size: 36))
            Text("Create an account so you can order your product easily and quickly.")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .offset(y:-20)
                .padding()

            
                    VStack(spacing:15) {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 0.5)
                            .frame(height:50).padding(.horizontal,48)
                            .overlay{
                                HStack{
                                    Image(systemName: "person")
                                        .foregroundColor(.gray)
                                    TextField("Username",text:$username)
                                }.padding(.horizontal,56)
                            }
                        
                        
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 0.5)
                            .frame(height:50).padding(.horizontal,48)
                            .overlay{
                                HStack{
                                    Image(systemName: "envelope")
                                        .foregroundColor(.gray)
                                    SecureField("Email",text:$email)
                                }.padding(.horizontal,56)
                                
                            }
                        
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 0.5)
                            .frame(height:50).padding(.horizontal,48)
                            .overlay{
                                HStack{
                                    Image(systemName: "lock")
                                        .foregroundColor(.gray)
                                    SecureField("Password",text:$password)
                                }.padding(.horizontal,56)
                                
                            }
                        
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 0.5)
                            .frame(height:50).padding(.horizontal,48)
                            .overlay{
                                HStack{
                                    Image(systemName: "lock")
                                        .foregroundColor(.gray)
                                    SecureField("Confirm Password",text:$password)
                                }.padding(.horizontal,56)
                                
                            }
                        
                        Button(action:{
                          }
                               ,label: {
                            RoundedRectangle(cornerRadius: 15).frame(height:50)
                                .padding(.horizontal,47)
                                .padding(.top)
                            .foregroundColor(.green)})
                                    .overlay{
                                    Text("Register Now").bold()
                                        .foregroundStyle(.white)
                                        .padding(.top)
                                    }
                    }.offset(y:20)
                    
                
            Spacer()
            
               
            }
        .offset(y:100)
        .navigationBarBackButtonHidden(true)
    
    HStack{
        Text("Already have an Account?")
        Text("Log In").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
    }
}

#Preview {
    SignupView()
}
