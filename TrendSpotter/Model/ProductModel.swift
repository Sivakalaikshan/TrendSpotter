//
//  ProductModel.swift
//  TrendSpotter
//
//  Created by NIBM-LAB04-PC02 on 2024-03-30.
//

import Foundation 

struct ProductModel: Codable, Identifiable {
    var id: String
    let productName: String
    let brandName: String
    let categoryName: String
    let subcategoryName: String
    let price: Int
    let image: String
    // Add other properties as needed
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case productName
        case brandName
        case categoryName
        case subcategoryName
        case price
        case image = "imageUrl"
    }
}




struct APIConstants {
    static let getallURL = "https://clothing-api-ios.onrender.com/products/get"
    static let getidURL = "https://clothing-api-ios.onrender.com/getid/"
    static let getbrandURL = "https://clothing-api-ios.onrender.com/products/products"
}


