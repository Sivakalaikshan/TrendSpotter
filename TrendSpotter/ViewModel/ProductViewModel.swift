//
//  ProductViewModel.swift
//  TrendSpotter
//
//  Created by NIBM-LAB04-PC02 on 2024-03-30.
//

import Foundation
class ProductViewModel: ObservableObject {
    @Published var products: [ProductModel] = []
    @Published var selectedProductID: String?
    
    init() {
        self.fetchProducts();
    }

    func fetchProducts() {
        guard let url = URL(string: APIConstants.getallURL) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Failed to fetch products: \(error)")
                } else {
                    print("No data received")
                }
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode([ProductModel].self, from: data)
                DispatchQueue.main.async {
                    self.products = decodedResponse
                    print("hit");
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }

        }.resume()
    }
    
    func fetchProductDetails(for productID: String) {
            guard let url = URL(string: "\(APIConstants.getidURL)\(productID)") else {
                print("Invalid URL")
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    if let error = error {
                        print("Failed to fetch product details: \(error)")
                    } else {
                        print("No data received")
                    }
                    return
                }

                do {
                    _ = try JSONDecoder().decode(ProductModel.self, from: data)
                    // Assuming you want to update the selected product details
                    DispatchQueue.main.async {
                        // Update the product details or navigate to a new view with the details
                        // For example:
                        // self.selectedProduct = decodedResponse
                        // or
                        // self.navigateToProductDetails(decodedResponse)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }.resume()
        }
}
