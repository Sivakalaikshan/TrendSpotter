//
//  ProductView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI
import URLImage

struct ProductView: View {
    
    @StateObject var viewModel: ProductViewModel = ProductViewModel()
    @State private var search: String = ""
    @State private var isEditing = false
    @State private var selectedButton: String?
    @State private var showProductDetails = false
    @State private var showProductView = false
    @State private var isTabViewHidden = false
    

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
        NavigationView{
            VStack{
                Text("Product List").font(.system(size: 22))
                Text("SHOW AVAILABLE").font(.system(size: 9))
                
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(lineWidth: 0.5)
                        .frame(width: 350, height: 50)
                        .padding(.horizontal, 48)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .offset(x:60) // Adjust the padding as needed
                        
                        TextField("Search", text: $search, onEditingChanged: { editing in
                            isEditing = editing
                        })
                        .padding(.horizontal, 56)
                        .padding(.trailing, 48) // Adjust the padding as needed
                        
                        if isEditing && !search.isEmpty {
                            Button(action: {
                                search = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.red)
                            }
                            .offset(x:-70) // Adjust the padding as needed
                        }
                    }
                }
                
                
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
                    }.padding()
                    
                }
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                        ForEach(viewModel.products) { product in
                            Button {
                                viewModel.selectedProductID = product.id
                                showProductView = true
                            } label: {
                                VStack {
                                    URLImage(URL(string: product.image)!) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 250)
                                            .cornerRadius(8)
                                    }
                                    
                                    Text(product.productName)
                                        .padding(.bottom, 4)
                                        .background(Color.white)
                                    Text("\(product.brandName) - Rs.\(product.price)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .cornerRadius(8)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                
                
                NavigationLink(destination: ProductDetailsView(productID: viewModel.selectedProductID ?? ""), isActive: $showProductView) {
                    EmptyView()
                    
                }.hidden()
                    .onAppear {
                                        isTabViewHidden = false
                                    }
                    .navigationBarBackButtonHidden(true)
                
                
                
                Spacer()
            }//end of top vstack
        }
        
    }
}

#Preview {
    ProductView()
            .environmentObject(ProductViewModel())
}
