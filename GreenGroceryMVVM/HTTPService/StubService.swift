
import Foundation
import UIKit

typealias GroceriesClosure = (GroceryResult) -> Void

protocol GroceriesAPI {
    func fetchGroceries(completion: GroceriesClosure) -> Void
}

class StubService {
    static let shared : StubService = StubService()

    private init() {}
}

extension StubService: GroceriesAPI {
    
    
    func fetchGroceries(completion: (GroceriesClosure)) {
     if let url = Bundle.main.url(forResource: "Products", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let groceryResult = try JSONDecoder().decode(GroceryResult.self, from: data)
                completion(groceryResult)
            } catch let error {
                print("Something went wrong with error = \(error)")
            }
        }
    }
}

