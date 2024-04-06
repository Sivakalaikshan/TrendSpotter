//
//  CartViewModel.swift
//  TrendSpotter
//
//  Created by NIBM-LAB04-PC02 on 2024-03-30.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var cartItems: [CartModel] = []
    
  /*  func getAllCartItems() {
        guard let url = URL(string: APIConstantsCart.getallURL) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let cartItems = try JSONDecoder().decode([CartModel].self, from: data)
                    DispatchQueue.main.async {
                        self.cartItems = cartItems
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
    
    func saveCartItem(_ cartItem: CartModel) {
        guard let url = URL(string: APIConstantsCart.postURL) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(cartItem)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error saving cart item: \(error)")
                    return
                }
                
                if let data = data {
                    // Process the response from the server if needed
                    print("Cart item saved successfully")
                }
            }.resume()
        } catch {
            print("Error encoding cart item: \(error)")
        }
    }*/

    
  

}

