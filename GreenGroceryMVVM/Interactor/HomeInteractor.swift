
import Foundation

typealias SkuItem = (skuId: String, quantity: Int)

class HomeInteractor {
    var service: GroceriesAPI
    
    var dataBase: CartDB
    
    init(service: GroceriesAPI, dataBase: CartDB) {
        self.service = service
        self.dataBase = dataBase
    }
}

extension HomeInteractor {
  
    func getGroceries(completion: (GroceryResult) -> Void) {
        service.fetchGroceries { (result) in
            completion(result)
        }
    }
}
