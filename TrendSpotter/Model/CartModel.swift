//
//  CartModel.swift
//  TrendSpotter
//
//  Created by NIBM-LAB04-PC02 on 2024-03-30.
//

import Foundation
struct CartModel: Codable {
    let product: String // Assuming this is the product ID
       let quantity: Int
       let size: String
    
    enum CodingKeys: String, CodingKey {
        case product = "productId"
        case quantity
        case size
    }
}




struct APIConstantsCart {
    static let getallURL = "https://clothing-api-ios.onrender.com/cart/get"
    static let postURL = "https://clothing-api-ios.onrender.com/cart"
    
}
