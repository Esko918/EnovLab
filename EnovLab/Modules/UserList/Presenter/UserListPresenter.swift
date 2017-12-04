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
    var users:[User] = [] {
        didSet{
            if(users.count > 0){
                view?.presentUserListData(users: users)
            }
            else{
                
                view?.displayDataNotFound()
                
            }
        }
    }
    
    // MARK: Public Methods
    func viewDidLoad() {
        interacter.fetchUsers()
    }
    
    func userSelected(atIndex index: Int) {
        router.presentDetails(forUser: self.users[index])
    }
}

// MARK: User List Interacter Output
extension UserListPresenter: UserListInteracterOutput{
    func usersFetched(_ users: [User]) {
        self.users = users
        
    }
    func failedUserFetch(){
        view?.displayDataNotFound()
    }
}
