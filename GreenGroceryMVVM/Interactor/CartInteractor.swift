//
//  CartInteractor.swift
//  GreenGroceryMVVM
//
//  Created by MacBook Air on 05.04.2023.
//

import Foundation
import UIKit

class CartInteractor {
    
    var dataBase: CartDB
    init(dataBase: CartDB) {
        self.dataBase = dataBase
    }

}

extension CartInteractor {
    
    func getCartCount(closure: @escaping CartCountClosure) {
        self.dataBase.getCount(closure: closure)
    }
    
    func getCartItem(skuId: String) -> CartItem {
      return self.dataBase.getCartItem(usingSkuId: skuId)
    }
    
    func addToCard(skuItem: SkuItem) -> Bool {
        guard skuItem.quantity > 0 else  {
            return self.dataBase.delete(usingSkuId: skuItem.skuId)
        }
      return  self.dataBase.updateCart(using: CartItem(skuId: skuItem.skuId, value: skuItem.quantity))
    }
    
}
