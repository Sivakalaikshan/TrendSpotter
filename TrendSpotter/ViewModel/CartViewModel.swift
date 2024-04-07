import Foundation
import Combine

class CartViewModel: ObservableObject {
    @Published var cartItems: [CartModel] = []
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "cartItems") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([CartModel].self, from: data) {
                cartItems = decoded
            }
        }
    }

    
    func addItem(_ item: CartModel) {
            cartItems.append(item)
            saveCartItems()
        }
    
    private func saveCartItems() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(cartItems) {
            UserDefaults.standard.set(encoded, forKey: "cartItems")
        }
    }

    
}
