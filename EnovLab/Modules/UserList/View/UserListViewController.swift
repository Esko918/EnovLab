//
//  ViewController.swift
//  EnovLab
//
//  Created by Charles Graffeo on 11/29/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {

    var presenter:UserListPresentation!
    var users:[User]!// I know data is not supposed to be in the view but the standard for using a tableview in a viper design pattern is to have the data in both the presenter and view controller and have them match
    
    var tableview:UITableView!
    
    // MARK: Override Methods
    override func loadView() {
        
        self.title = "User List"
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        
        tableview = UITableView(frame: .zero)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
        self.view = view
    
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        
    }
    
    override func updateViewConstraints() {
        
        self.view.addConstraint(NSLayoutConstraint(item: self.tableview,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self.view,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableview,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: self.view,
                                                   attribute: .top,
                                                   multiplier: 1.0,
                                                   constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableview,
                                                   attribute: .trailing,
                                                   relatedBy: .equal,
                                                   toItem: self.view,
                                                   attribute: .trailing,
                                                   multiplier: 1.0,
                                                   constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableview,
                                                   attribute: .bottom,
                                                   relatedBy: .equal,
                                                   toItem: self.view,
                                                   attribute: .bottom,
                                                   multiplier: 1.0,
                                                   constant: 0))
        
        super.updateViewConstraints()
    }
}

extension UserListViewController:UserListView{
    
    func presentUserListData(users:[User]){
        self.users = users
        self.tableview.reloadData()
    }
    
    func displayDataNotFound() {
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User List Data cannot be found"
        self.view.addSubview(label)
        
        self.view.addConstraint(NSLayoutConstraint(item: label,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: self.view,
                                                   attribute: .centerX,
                                                   multiplier: 1.0,
                                                   constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: label,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: self.view,
                                                   attribute: .centerY,
                                                   multiplier: 1.0,
                                                   constant: 0))
    }
}

extension UserListViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.userSelected(atIndex: indexPath.row)
    }
    
}

extension UserListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
    
    
}
