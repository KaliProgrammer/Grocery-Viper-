
import Foundation

protocol HomePresentation {
    func viewDidLoad() -> Void
    func onAddToCart(skuItem: SkuItem)
}

class HomePresenter {
    
    typealias UseCase = (
        getGroceries: (_ completion: (GroceryResult) -> (Void)) -> Void,
        addToCart: (SkuItem) -> (Bool),
        getCartItem: (String) -> CartItem
    )
    
    weak var view: HomeView?
    var useCase: UseCase?
    var router: HomeRouting?
    
    init(view: HomeView, useCase: HomePresenter.UseCase, router: HomeRouting) {
        self.view = view
        self.useCase = useCase
        self.router = router
    }
}

extension HomePresenter: HomePresentation {
    
    func viewDidLoad() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.useCase?.getGroceries( { (result) in
                let groceryList = result.groceries
                    .compactMap { grocery -> GroceryItemViewModel in
                    let cartItem = self?.useCase?.getCartItem(grocery.skuId)
                   return GroceryItemViewModel(using: grocery, cartItem: cartItem!)}
                DispatchQueue.main.async {
                    self?.view?.updateGroceries(groceriesList: groceryList)
                }
            })
        }
    }
    
    func onAddToCart(skuItem: SkuItem) {
        
        DispatchQueue.global(qos: .background).async {
            let update = self.useCase?.addToCart(skuItem)
            print("Add to card updated with result \(String(describing: update))")
            DispatchQueue.main.async {
                //TODO: - implement activity indicator.
                
            }
        }
    }
}
