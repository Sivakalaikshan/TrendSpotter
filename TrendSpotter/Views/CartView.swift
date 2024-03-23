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

struct PaymentButtonStyle: ButtonStyle {
    let isSelected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .foregroundColor(isSelected ? .white : .black)
            .background(isSelected ? Color.black : Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.gray.opacity(0.5) : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct CartView: View {
    @State private var products: [Product] = [
        Product(name: "Rayon Printed Shirt", brand: "ODEL", price: 2500.00, quantity: 1, image: "odelshirt"),
        Product(name: "Casual T-shirt", brand: "Levis", price: 2000.00, quantity: 1, image: "levistshirt"),
        Product(name: "Casual T-shirt", brand: "Levis", price: 2000.00, quantity: 1, image: "levistshirt")
    ]
    @State private var subtotal = 4500
    @State private var shipping = 450
    @State private var total = 4950
    @State private var isCashOnDeliverySelected = false
    @State private var isCardPaymentSelected = false
    @State private var isCheckoutViewPresented = false

    var body: some View {
        VStack {
            Text("My Cart").font(.system(size: 22)).bold()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ScrollView{
                    ForEach(products, id: \.id) { product in
                        // Product item view
                        HStack(spacing: 20) {
                            Image(product.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 100)
                                .padding(.trailing, 100)
                            
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
                                    
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                        .padding(.leading, 50)
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
                }
                .padding()
                .frame(height: 300)

                Divider()
                    .background(Color.black)
                    .padding(.bottom, 1)
                HStack {
                    Text("Sub Total").bold()
                        .padding(.trailing, 10)
                    Spacer()
                    Text("Rs.\(subtotal)")

                }.padding()
                HStack {
                    Text("Shipping").bold()
                        .padding(.trailing, 10)
                    Spacer()
                    Text("Rs.\(shipping)")

                }.padding()
                HStack {
                    Text("Total").font(.system(size: 25)).bold()
                        .padding(.trailing, 10)
                    Spacer()
                    Text("Rs.\(total)")


                }.padding()

                Divider()
                    .background(Color.black)
                    .padding(.bottom, 1)

                Text("Payment Method")
                    .font(.headline)
                    .padding()

                HStack {
                    Button("Cash on Delivery") {
                        isCashOnDeliverySelected.toggle()
                        isCardPaymentSelected = false
                    }
                    .buttonStyle(PaymentButtonStyle(isSelected: isCashOnDeliverySelected))

                    Button("Card Payment") {
                        isCardPaymentSelected.toggle()
                        isCashOnDeliverySelected = false
                    }
                    .buttonStyle(PaymentButtonStyle(isSelected: isCardPaymentSelected))
                }

                Button("Proceed To Checkout") {
                    isCheckoutViewPresented = true
                }
                .buttonStyle(MyButtonStyle())
                .padding()
            }
        }
        .sheet(isPresented: $isCheckoutViewPresented) {
            CheckoutView()
        }
        .navigationBarTitle("Cart")
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
