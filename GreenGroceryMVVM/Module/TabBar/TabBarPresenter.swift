//
//  TabBarPresenter.swift
//  GreenGroceryMVVM
//
//  Created by MacBook Air on 05.04.2023.

import Foundation

protocol TabBarPresentation {
    func viewDidLoad()
}
class TabBarPresenter {
    
    weak var view: TabBArView?
    typealias UseCase = (
        getCartCount: (@escaping CartCountClosure) -> Void, ()
    )
    var useCase: UseCase
    init(useCase: TabBarPresenter.UseCase) {
        self.useCase = useCase
    }
}

extension TabBarPresenter: TabBarPresentation {
    func viewDidLoad() {
        
        useCase.getCartCount {
            self.view?.updateCartCount(count: $0)
        }
    }
    
    
}
