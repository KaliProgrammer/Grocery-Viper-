

import Foundation
import UIKit

class ProfileModuleBuilder {
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let view = ProfileViewController()
        
        //        view.title = "Fresh Groceries"
        //        let interactor = HomeInteractor(service: StubService.shared, dataBase: RealmDataBase.shared)
        //        let router = HomeRouter(viewController: view)
        //        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        //        view.presenter = presenter
        //        return factory(view)
        return factory(view)
    }
}

