//
//  Router.swift
//  GreenGroceryMVVM
//
//  Created by MacBook Air on 31.03.2023.
//

import Foundation
import UIKit

class TabBarRouter {
    
    var viewController: UIViewController
    
    typealias SubModules = (
        home: UIViewController,
        cart: UIViewController,
        profile: UIViewController
    )
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}


extension TabBarRouter {
   static func tabs(usingSubModules subModules: SubModules) -> GroceryTabs {
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 11)
        let profileTabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 11)
        let cartTabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 11)

        
        subModules.home.tabBarItem = homeTabBarItem
        subModules.profile.tabBarItem = profileTabBarItem
        subModules.cart.tabBarItem = cartTabBarItem
        
        return (
            home: subModules.home,
            cart: subModules.cart,
            profile: subModules.profile
        )
    }
}
