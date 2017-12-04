//
//  UserRouter.swift
//  EnovLab
//
//  Created by Charles Graffeo on 11/29/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

class UserRouter: UserWireframe {
    
    var viewController: UIViewController?
    static func assembleModule(withUser user: User) -> UIViewController {
        
        let view = UserViewController()
        let presenter = UserPresenter()
        presenter.user = user
        
        view.presenter = presenter
        presenter.view = view
        
        return view
        
    }
    

}
