//
//  UserListProtocols.swift
//  EnovLab
//
//  Created by Charles Graffeo on 11/29/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

protocol UserListView: class {
    
    var presenter: UserListPresentation! { get set }
    func presentUserListData(users:[User])
    func displayDataNotFound()
    
}

protocol UserListPresentation: class{
    
    weak var view: UserListView? { get set }
    var interacter: UsersListCase! { get set }
    var router: UserListWireframe! { get set }
    
    func viewDidLoad()
    func userSelected(atIndex index:Int)
    
}

protocol UsersListCase: class {
    weak var output: UserListInteracterOutput! { get set }
    func fetchUsers()
}

protocol UserListInteracterOutput: class {
    func usersFetched(_ users:[User])
    func failedUserFetch()
}

protocol UserListWireframe: class {
    
    weak var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
    func presentDetails(forUser user:User)
    
}
