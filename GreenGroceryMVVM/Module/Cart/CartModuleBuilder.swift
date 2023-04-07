//
//  Builder.swift
//  GreenGroceryMVVM
//
//  Created by MacBook Air on 31.03.2023.
//

import Foundation
import UIKit

class CartModuleBuilder {
   static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let view = CartViewController()
        
        return factory(view)
//        let interactor = HomeInteractor(service: StubService.shared, dataBase: RealmDataBase.shared)
//        let router = HomeRouter(viewController: view)
//        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
//        view.presenter = presenter
//        return factory(view)
    }
}
