//
//  CheckoutView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI

struct CheckoutView: View {
    
    @State private var addressText = "33, Rajamalwatha road, colombo-15"
    @State private var cardname = "Sivakalaikshan"
    @State private var cardnumber = "**** **** **** 1234"
    @State private var cvv = "007"
    @State private var expireDate = "07/11"
    let selectedPaymentMethod: PaymentMethod?
    let totalPrice: Double
    @State private var showAlert = false
    @State private var navigateToHome = false

    var body: some View {
        NavigationView {
            VStack{
                Text("Checkout").font(.system(size: 22)).bold()
                    
                Divider().background(Color.black)
                
                VStack {
                    HStack {
                        Text("Delivery Address")
                            .underline()
                            .bold()
                            .padding(.trailing, 120)
                        
                        Text("edit")
                            .foregroundColor(.blue)
                        
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.blue)
                    }
                    .padding(.top)
                    
                    NavigationStack {
                        TextEditor(text: $addressText)
                            .background(Color.gray.opacity(0.5))
                            .scrollContentBackground(.hidden)
                    }.frame(width: 330,height: 80).cornerRadius(10).padding()
                    
                }
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding()
                
                if selectedPaymentMethod == .cardPayment {
                    VStack {
                        HStack {
                            Text("Card Details")
                                .underline()
                                .bold()
                                .padding(.trailing, 230)
                        }
                        .padding(.top)
                        .padding(.bottom)
                        
                        VStack {
                            Text("Name in the card").padding(.trailing,200)
                            
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 0.3) // Border color and width
                                .frame(width: 330, height: 50)
                                .overlay {
                                    HStack {
                                        TextEditor(text: $cardname).font(.system(size: 16)).padding(.top,-10)
                                    }
                                    .padding()
                                }
                            
                            Text("Card number").padding(.trailing,200)
                            
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 0.3) // Border color and width
                                .frame(width: 330, height: 50)
                                .overlay {
                                    HStack {
                                        TextEditor(text: $cardnumber).font(.system(size: 16)).padding(.top,-10)
                                    }
                                    .padding()
                                }
                            
                            HStack {
                                VStack {
                                    Text("CVV")
                                    
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(lineWidth: 0.3) // Border color and width
                                        .frame(width: 100, height: 50)
                                        .overlay {
                                            HStack {
                                                TextEditor(text: $cvv).font(.system(size: 16)).padding(.top,-10)
                                            }
                                            .padding()
                                        }
                                }.padding(.trailing, 90)
                                
                                VStack {
                                    Text("Expire date")
                                    
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(lineWidth: 0.3) // Border color and width
                                        .frame(width: 100, height: 50)
                                        .overlay {
                                            HStack {
                                                TextEditor(text: $expireDate).font(.system(size: 16)).padding(.top,-10)
                                            }
                                            .padding()
                                        }
                                }
                            }
                        }
                        .padding()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                
                Button(action: {
                    showAlert = true
                    UserDefaults.standard.removeObject(forKey: "cartItems")

                }) {
                    Text("Pay (Rs.\(String(format: "%.2f", totalPrice)))")
                    
                        .padding()
                        .frame(width: 360)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(10)
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Order Placed"),
                          message: Text("Your order will arrive in 3 days."),
                          dismissButton: .default(Text("OK")) {
                        navigateToHome = true
                    })
                    
                }
                .background(NavigationLink(destination: NavigationBarView(isTabViewHidden: .constant(false)), isActive: $navigateToHome) {
                    EmptyView()
                })
                
                
                
                
                Spacer()
                
            }//end of top vstack
        }
    }
}

#Preview {
    CheckoutView(selectedPaymentMethod: .cashOnDelivery, totalPrice: 0.0)
}

