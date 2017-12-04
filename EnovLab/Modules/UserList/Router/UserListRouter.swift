//
//  UserListRouter.swift
//  EnovLab
//
//  Created by Charles Graffeo on 11/29/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

class UserListRouter: UserListWireframe {
    
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        
        let view = UserListViewController()
        let presenter = UserListPresenter()
        let interacter = UserListInteracter()
        let router = UserListRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interacter = interacter
        presenter.router = router
        
        interacter.output = presenter
        router.viewController = view
        
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
        
    }
    
    func presentDetails(forUser user: User) {
        
        let detailsView = UserRouter.assembleModule(withUser: user)
        viewController?.navigationController?.pushViewController(detailsView, animated: true)
        
    }

}
