//
//  RealmCartItem.swift
//  GreenGroceryMVVM
//
//  Created by MacBook Air on 29.03.2023.
//

import RealmSwift
import Foundation

class RealmCartItem: Object {
    
    @objc dynamic var skuId: String = ""
    @objc dynamic var value: Int = 0
    @objc dynamic var updated: Date = Date()

    override static func primaryKey() -> String? {
        return "skuId"
    }

}

extension RealmCartItem {
  convenience init(cartItem: CartItem) {
        self.init()
        self.skuId = cartItem.skuId
        self.value = cartItem.value
    }
}

extension CartItem {
    
    
    init(realCartItem: RealmCartItem) {
        self.skuId = realCartItem.skuId
        self.value = realCartItem.value
    }
    
}
