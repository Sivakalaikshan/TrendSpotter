//
//  ProductView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI
import URLImage

struct ProductView: View {
    
    @ObservedObject var ViewModel: ProductViewModel
    @State private var search: String = ""
    @State private var isEditing = false
    @State private var selectedButton: String? = "All"
    @State private var showProductDetails = false
    @State private var showProductView = false
    @State private var isTabViewHidden = false
    @State private var brandName: String?
    @State private var selectedProductID: String?
    var productID: String?
    
    
   
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
                        ForEach(["All", "Shirt", "T-Shirt", "Man", "Woman"], id: \.self) { title in
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
                        ForEach(ViewModel.products.filter { product in
                            let searchLowercased = search.lowercased()
                                let productNameMatch = search.isEmpty || product.productName.localizedCaseInsensitiveContains(searchLowercased)
                                let selectedButtonMatch = selectedButton == "All" || selectedButton == product.subcategoryName || selectedButton == product.categoryName
                                
                                return productNameMatch && selectedButtonMatch
                        }) { product in
                            NavigationLink(destination: ProductDetailsView(productID: selectedProductID ?? "")) {
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
                            .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to remove default button styles
                            .simultaneousGesture(TapGesture().onEnded {
                                selectedProductID = product.id
                            })
                        }
                    }
                }

           
                
                
                
                
                
                Spacer()
            }//end of top vstack
            
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    NavigationView {
        ProductView(ViewModel: ProductViewModel(), productID: "defaultProductID")
            .environmentObject(ProductViewModel())
    }
}
