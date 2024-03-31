//
//  ProductDetailsView.swift
//  TrendSpotter
//
//  Created by NIBMPC04PC03 on 2024-03-29.
//

import SwiftUI
import URLImage

struct ProductDetailsView: View {
    @EnvironmentObject var cartVM: CartViewModel
    @State private var islogged: Bool = false
    @State private var isLoginScreenPresented = false
        @State private var selectedSize: String?
    @State private var selectedButton: String?
    @State private var showCartView = false
    @ObservedObject var viewModel: ProductViewModel
        let productID: String
        
    init(productID: String) {
        self.productID = productID
        self.viewModel = ProductViewModel()
        viewModel.fetchProductDetails(for: productID)
    }
    var body: some View {
        NavigationView{
            VStack{
                
                
                if let product = viewModel.products.first(where: { $0.id == productID }) {
                    URLImage(URL(string: product.image)!) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 500)
                            .cornerRadius(10)
                            .padding()
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text(product.productName)
                            .font(.title)
                            .padding(.bottom, 4)
                            .background(Color.white)
                        
                        Text("\(product.brandName) - Rs.\(product.price)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }.offset(x:-50)
                    
                    HStack(spacing: 20) {
                        ForEach(["S", "M", "L", "XL", "XXL"], id: \.self) { title in
                            Button(action: {
                                selectedButton = title
                                selectedSize = title
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
                    
                    Button(action: {
                        showCartView = true
                        if islogged{
                            if let selectedSize = selectedSize {
                                let cartItem = CartModel( product: viewModel.products.first?.id ?? "" , quantity: 1, size: selectedSize)
                                cartVM.saveCartItem(cartItem)
                            }
                        }
                        else {
                            isLoginScreenPresented = true
                        }
                    }) {
                        Text("Add Cart")
                            .padding()
                            .frame(width: 360)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: LoginView(productID: viewModel.selectedProductID ?? ""), isActive: $showCartView){
                        
                    }
                    .navigationBarBackButtonHidden(true)
                    
                    
                    
                    Spacer()
                }
                
            }//end of top vstack
            
            
        }
        
        
    }
}

#Preview {
    ProductDetailsView(productID: "")
        .environmentObject(CartViewModel())
}
