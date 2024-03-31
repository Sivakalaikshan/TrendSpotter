//
//  LoginViewModel.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-16.
//

import Foundation
import Foundation
import SwiftUI



class LoginViewModel: ObservableObject{
    @Published var username : String = ""
    @Published var password : String = ""
    @Published var showError : Bool = false
    @Published var errorMessage : String = ""
    @Published var success : Bool = false
    @Published var navigateToSignup: Bool = false
    
    
    func verifyLogin()
    {
        if username.isEmpty || password.isEmpty {
            showError = true
            errorMessage = "User Name and Password connot be an empty!"}
        else if (username.lowercased() == "abc" && password == "123"){
            showError = false
        }else{
            showError = true
            errorMessage = "User Name and Password mismatched. Please try again!!"
        }
    }
}

