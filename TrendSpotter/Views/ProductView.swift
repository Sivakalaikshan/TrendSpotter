//
//  ProductView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI

struct ProductView: View {
    @State private var selectedButton: String?
    struct Product {
            let name: String
            let imageName: String
            let brand: String
            let price: Double
        }

        let products: [Product] = [
            Product(name: "Rayon Printed Shirt",  imageName: "odelshirt",brand: "ODEL" , price: 2500.00),
            Product(name: "Casual T-shirt", imageName: "levistshirt", brand: "Levis" , price: 2000.00)
        ]
    var body: some View {
        VStack{
            Text("Product List").font(.system(size: 22))
            Text("SHOW AVAILABLE").font(.system(size: 9))
            
           // HStack {
             //   Image(systemName: "chevron.left").bold()
              //      .padding(.trailing,100)
                    
               //     VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                //        Text("Product List").font(.system(size: 22))
                //        Text("SHOW AVAILABLE").font(.system(size: 9))
                 //   }
          //  }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).padding()
            
            ScrollView(.horizontal) {
                       HStack(spacing: 20) {
                           ForEach(["New Arrivals", "Shirts", "Jeans", "Men", "Women", "Kids"], id: \.self) { title in
                               Button(action: {
                                   selectedButton = title
                               }) {
                                   Text(title)
                                       .padding(.horizontal, 15)
                                       .padding(.vertical, 8)
                                       .foregroundColor(selectedButton == title ? .white : .black)
                                       .background(selectedButton == title ? Color.black : Color.white)
                                       .cornerRadius(8)
                                       .overlay(
                                           RoundedRectangle(cornerRadius: 8)
                                               .stroke(Color.black, lineWidth: 1)
                                       )
                               }
                           }
                       }
                       .padding()
                   }
            
            ScrollView {
                       LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                           ForEach(products, id: \.name) { product in
                               VStack {
                                   Image(product.imageName)
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 150, height: 250)
                                       .cornerRadius(8)
                                   Text(product.name)
                                       .padding(.bottom, 4)
                                       .background(Color.white)
                                   Text("\(product.brand) - Rs.\(product.price, specifier: "%.2f")")
                                       .font(.subheadline)
                                       .foregroundColor(.gray)
                               }
                               .frame(maxWidth: .infinity)
                               .padding(8)
                               .cornerRadius(8)
                           }
                       }
                       .padding()
                   }

            
            
            Spacer()
        }//end of top vstack
    }
}

#Preview {
    ProductView()
}
