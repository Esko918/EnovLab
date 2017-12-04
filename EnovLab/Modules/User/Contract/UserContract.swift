//
//  UserProtocols.swift
//  EnovLab
//
//  Created by Charles Graffeo on 11/29/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

protocol UserView: class {
    func presentUser(user:User)
}

protocol UserPresentation: class {
    
    weak var view:UserView? { get set }
    var user:User! { get set }
    
}
protocol UserWireframe: class{
    
    weak var viewController: UIViewController? { get set }
    static func assembleModule(withUser user:User) ->UIViewController
    
}

