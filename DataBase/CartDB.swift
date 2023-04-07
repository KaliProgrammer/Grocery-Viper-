
import Foundation

typealias CartCountClosure = (Int) -> (Void)
protocol CartDB {
    func getCartItem(usingSkuId skuId: String) -> CartItem
    func updateCart(using cartItem: CartItem) -> Bool
    func delete(usingSkuId skuId: String) -> Bool
//    func getCount() async -> Int
    func getCount(closure: @escaping CartCountClosure)
}
