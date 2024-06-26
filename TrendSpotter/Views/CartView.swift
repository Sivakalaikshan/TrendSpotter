//
//  CartView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI
import URLImage


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
enum PaymentMethod {
   case cashOnDelivery, cardPayment
}

struct CartView: View {
   
    @State private var subtotal = 4500
    @State private var shipping = 450
    @State private var total = 0
    @State private var isCashOnDeliverySelected = false
    @State private var isCardPaymentSelected = false
    @State private var isCheckoutViewPresented = false
    @State private var products: [CartModel] = []
    @State private var showAlert = false
    
    @State private var selectedPaymentMethod: PaymentMethod?

        

    
    var body: some View {
        VStack {
            Text("My Cart").font(.system(size: 22)).bold()
            ScrollView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(products, id: \.id) { product in
                            // Product item view
                            HStack(spacing: 20) {
                                URLImage(URL(string: product.image)!) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60, height: 100)
                                        .padding(.trailing, 100)
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(product.productName)
                                        .font(.headline)
                                    Text("\(product.brandName) - \(product.selectedSize)")
                                        .font(.subheadline)
                                    Text("Rs.\(product.price).00")

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
                                        
                                        Button(action: {
                                            // Remove the product from the cart
                                            products.removeAll(where: { $0.id == product.id })
                                            // Remove the product from local storage
                                            removeFromLocalStorage(product)
                                            
                                        }) {
                                            Image(systemName: "trash")
                                                .foregroundColor(.red)
                                                .padding(.leading, 50)
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
                    .frame(height: 300)
                }

                Divider()
                    .background(Color.black)
                    .padding(.bottom, 1)
                HStack {
                    Text("Sub Total").bold()
                        .padding(.trailing, 10)
                    Spacer()
                    Text(String(format: "RS.%.2f", calculateTotalPrice()))

                }.padding()
                HStack {
                    Text("Shipping").bold()
                        .padding(.trailing, 10)
                    Spacer()
                    Text("Rs.\(shipping).00")

                }.padding()
                
                HStack {
                    Text("Total").font(.system(size: 25)).bold()
                        .padding(.trailing, 10)
                    Spacer()
                    Text(String(format: "RS.%.2f", totalPriceIncludingShipping))


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
                        selectedPaymentMethod = .cashOnDelivery
                    }
                    .buttonStyle(PaymentButtonStyle(isSelected: selectedPaymentMethod == .cashOnDelivery))

                    Button("Card Payment") {
                        isCardPaymentSelected.toggle()
                        isCashOnDeliverySelected = false
                        selectedPaymentMethod = .cardPayment
                    }
                    .buttonStyle(PaymentButtonStyle(isSelected: selectedPaymentMethod == .cardPayment))
                }

                Button("Proceed To Checkout") {
                    if products.isEmpty {
                           showAlert = true
                       } else {
                           isCheckoutViewPresented = true
                       }
                }
                .buttonStyle(MyButtonStyle())
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Empty Cart"), message: Text("No products in the cart."), dismissButton: .default(Text("OK")))
                }
            }
        }
        .onAppear(){
            if let data = UserDefaults.standard.data(forKey: "cartItems") {
                            if let decoded = try? JSONDecoder().decode([CartModel].self, from: data) {
                                products = decoded
                                print("Loaded \(products.count) cart items from UserDefaults")
                            }
                        }
        }
        .onDisappear(){
            products = []
        }
        .sheet(isPresented: $isCheckoutViewPresented) {
            CheckoutView(selectedPaymentMethod: selectedPaymentMethod, totalPrice: totalPriceIncludingShipping)
        }
        .navigationBarBackButtonHidden(true)
    }

    private func updateQuantity(for product: CartModel, increase: Bool) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            var updatedProduct = product
            if increase {
                updatedProduct.quantity += 1
            } else {
                updatedProduct.quantity -= 1
            }
            if updatedProduct.quantity <= 0 {
                products.remove(at: index)
                removeFromLocalStorage(product)
            } else {
                products[index] = updatedProduct
                updateLocalStorage(products)
            }
        }
    }

    private func removeFromLocalStorage(_ product: CartModel) {
        // Retrieve the existing array of products from UserDefaults
        guard var savedData = UserDefaults.standard.data(forKey: "cartItems") else {
            print("No data found for key 'cartItems'")
            return
        }

        do {
            var decodedItems = try JSONDecoder().decode([CartModel].self, from: savedData)
            // Filter out the product to remove
            decodedItems = decodedItems.filter { $0.id != product.id }
            
            // Encode the updated array and save it back to UserDefaults
            if let encoded = try? JSONEncoder().encode(decodedItems) {
                UserDefaults.standard.set(encoded, forKey: "cartItems")
                print("Saved updated cart items to UserDefaults")
            } else {
                print("Error encoding updated cart items")
            }
        } catch {
            print("Error decoding cart items: \(error.localizedDescription)")
        }
    }

    private func updateLocalStorage(_ products: [CartModel]) {
        // Encode the updated array and save it back to UserDefaults
        if let encoded = try? JSONEncoder().encode(products) {
            UserDefaults.standard.set(encoded, forKey: "cartItems")
        }
    }

    private func calculateTotalPrice() -> Double {
        var total = 0.0
        for product in products {
            total += Double(product.price) * Double(product.quantity)
        }
        return total
    }

    private var totalPriceIncludingShipping: Double {
        return calculateTotalPrice() + Double(shipping)
    }

   
}







#Preview {
    CartView()
}
