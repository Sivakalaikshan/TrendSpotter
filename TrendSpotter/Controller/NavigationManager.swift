//
//  NavigationManager.swift
//  TrendSpotter
//
//  Created by NIBM-LAB04-PC07 on 2024-04-06.
//

import SwiftUI
import Combine

class NavigationManager: ObservableObject {
    static let shared = NavigationManager()
    
    @Published var navigateToProductDetails: Bool = false
    var productID: String?

    private init() {}

    func goToProductDetails(productID: String) {
        self.productID = productID
        navigateToProductDetails = true
    }
}

