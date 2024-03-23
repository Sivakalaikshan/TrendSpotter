//
//  CartView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI
struct Product {
    var id = UUID()
    var name: String
    var brand: String
    var price: Double
    var quantity: Int
    var image: String
}
struct CartView: View {
    @State private var products: [Product] = [
            Product(name: "Rayon Printed Shirt", brand: "ODEL", price: 2500.00, quantity: 1, image: "odelshirt"),
            Product(name: "Casual T-shirt", brand: "Levis", price: 2000.00, quantity: 1, image: "levistshirt")
        ]
    var body: some View {
        VStack{
            
            
            Text("My Cart").font(.system(size: 22)).bold()
            
            ScrollView {
                       VStack(alignment: .leading, spacing: 20) {
                           ForEach(products, id: \.id) { product in
                               HStack(spacing: 20) {
                                   Image(product.image)
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .frame(width: 60, height: 100)
                                       .padding(.trailing,100)
                                   
                                   VStack(alignment: .leading, spacing: 4) {
                                       Text(product.name)
                                           .font(.headline)
                                       Text(product.brand)
                                           .font(.subheadline)
                                       Text(String(format: "RS.%.2f", product.price))
                                           .font(.subheadline)
                                       HStack {
                                           Button(action: {
                                               updateQuantity(for: product, increase: false)
                                           }) {
                                               Image(systemName: "minus.circle")
                                           }
                                           Text("\(product.quantity)")
                                           Button(action: {
                                               updateQuantity(for: product, increase: true)
                                           }) {
                                               Image(systemName: "plus.circle")
                                           }
                                       }
                                   }
                               }
                               .padding(.vertical, 8)
                               .frame(maxWidth: .infinity)
                               .foregroundColor(.primary)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 10)
                                       .stroke(Color.gray, lineWidth: 1)
                               )
                           }

                       }
                       .padding()
                   }
            .frame(height: 300)
                   .navigationTitle("Shopping Cart")
            
            Spacer()
        }//end of top vstack
    }
    
    private func updateQuantity(for product: Product, increase: Bool) {
            if let index = products.firstIndex(where: { $0.id == product.id }) {
                var updatedProduct = product
                updatedProduct.quantity += increase ? 1 : -1
                if updatedProduct.quantity < 0 {
                    updatedProduct.quantity = 0
                }
                products[index] = updatedProduct
            }
        }
}

#Preview {
    CartView()
}
