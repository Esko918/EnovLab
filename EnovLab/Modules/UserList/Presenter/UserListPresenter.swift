//
//  UserListPresenter.swift
//  EnovLab
//
//  Created by Charles Graffeo on 11/29/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

class UserListPresenter: UserListPresentation {
    
    var view: UserListView?
    
    
    var interacter: UsersListCase!
    var router: UserListWireframe!
    
    func viewDidLoad() {
        
    }
    
    func userSelected(atIndex index: Int) {
        
    }
    

}

extension UserListPresenter: UserListInteracterOutput{
    func usersFetched(_ users: [User]) {
        
    }
    
    
}
