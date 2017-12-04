//
//  UserPresenter.swift
//  EnovLab
//
//  Created by Charles Graffeo on 11/29/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

class UserPresenter: UserPresentation {

    var view: UserView?
    var user: User!
    
    func viewDidLoad() {
        view?.presentUser(user: self.user)
    }
    
}
