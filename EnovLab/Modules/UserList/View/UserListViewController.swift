//
//  ViewController.swift
//  EnovLab
//
//  Created by Charles Graffeo on 11/29/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit
import AlamofireImage

class UserListViewController: UIViewController {

    var presenter:UserListPresentation!
    private var users:[User]!//With VIPER Your suppsoed to have the data
    private var tableview:UITableView!
    private let cellIdentifier = "UserListCellReuseIdentifier"
    
    // MARK: Override Methods
    override func loadView() {
        
        let view = UIView()
        
        self.title = "User List"
        self.tableview = UITableView(frame: .zero, style: .plain)
        self.tableview.translatesAutoresizingMaskIntoConstraints = false
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.register(UserListTableviewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        view.addSubview(self.tableview)
        
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

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? UserListTableviewCell
        
        let user = self.users[indexPath.row]
        cell?.name.text = user.fullname()
        cell?.jobTitle.text = user.jobTitle
        cell?.imageView?.af_setImage(withURL: URL(string: user.avatarUrl)!)
        return cell!
        
    }
   
}
