
import Foundation
import UIKit

class HomeModuleBuilder {
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let view = HomeViewController()
        view.title = "Fresh Groceries"
        let homeInteractor = HomeInteractor(service: StubService.shared, dataBase: RealmDataBase.shared)
        let router = HomeRouter(viewController: view)
        let cartInteractor = CartInteractor(dataBase: RealmDataBase.shared)
        view.presenter = HomePresenter(view: view, useCase: (
            getGroceries: homeInteractor.getGroceries,
            addToCart: cartInteractor.addToCard,
            getCartItem: cartInteractor.getCartItem
                
        ), router: router)
        return factory(view)
    }
}
