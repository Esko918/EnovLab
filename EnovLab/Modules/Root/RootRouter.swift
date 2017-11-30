//
//  RootRouter.swift
//  EnovLab
//
//  Created by Charles Graffeo on 11/29/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    
    func presentUserListScreen(in window: UIWindow) {
        
        window.makeKeyAndVisible()
        window.rootViewController = UserListRouter.assembleModule()
        
    }
}
