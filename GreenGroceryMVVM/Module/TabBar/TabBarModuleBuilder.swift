//
//  TabBarModuleBuilder.swift
//  GreenGroceryMVVM
//
//  Created by MacBook Air on 31.03.2023.
//

import Foundation
import UIKit



class TabBarModuleBuilder {
    static func build(usingSubModules subModules: TabBarRouter.SubModules) -> UITabBarController {
        let tabs = TabBarRouter.tabs(usingSubModules: subModules)
        let interactor = CartInteractor(dataBase: RealmDataBase.shared)
        let presenter = TabBarPresenter(useCase: (
            getCartCount: interactor.getCartCount, ()
        ))
        let tabBatController = GroceryTabBarController(tabs: tabs, presenter: presenter)
        presenter.view = tabBatController
        return tabBatController
        
    }
}
