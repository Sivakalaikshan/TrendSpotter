//
//  CartModel.swift
//  TrendSpotter
//
//  Created by NIBM-LAB04-PC02 on 2024-03-30.
//

import Foundation
struct CartModel: Codable,Identifiable, Hashable {
    var id: String
        var productName: String
        var brandName: String
        var selectedSize: String
        var price: Int
    var image: String
    var quantity: Int

}




