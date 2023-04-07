
import Foundation
import UIKit

struct CartValueViewModel {
    let skuId: String
    let title: String
    let stepValue: Int
    let showStepper: Bool
    
    init(skuId: String,stepValue: Int) {
        self.title = "ADD TO BAG"
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
        self.skuId = skuId
    }
}

extension CartValueViewModel {
    func onAddToBag() -> CartValueViewModel {
        return CartValueViewModel(skuId: self.skuId, stepValue: 1)
    }
    
    func onIncrement() -> CartValueViewModel {
        guard self.stepValue < 10 else { return self }
        return CartValueViewModel(skuId: self.skuId,  stepValue: self.stepValue + 1)
    }
    
    func onDecrement() -> CartValueViewModel {
        guard self.stepValue > 0 else { return self }
        return CartValueViewModel(skuId: self.skuId,  stepValue: self.stepValue - 1)
    }
}
