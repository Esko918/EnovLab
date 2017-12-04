//
//  UserViewController.swift
//  EnovLab
//
//  Created by Charles Graffeo on 11/29/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit
import AlamofireImage

class UserViewController: UIViewController {
    
    var presenter:UserPresentation!
    private var scrollView = UIScrollView()
    private var nameLbl = UILabel()
    private var emailLbl = UILabel()
    private var genderLbl = UILabel()
    private var avatarImageView = UIImageView()
    private var jobTitleLbl = UILabel()
    private var ageLbl = UILabel()
    private var descriptionLbl = UILabel()
    
    override func loadView() {
        
        let view = UIView()
        self.scrollView = UIScrollView()
        self.scrollView.backgroundColor = UIColor.green
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.nameLbl.translatesAutoresizingMaskIntoConstraints = false
        self.emailLbl.translatesAutoresizingMaskIntoConstraints = false
        self.genderLbl.translatesAutoresizingMaskIntoConstraints = false
        self.jobTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        self.ageLbl.translatesAutoresizingMaskIntoConstraints = false
        self.avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLbl.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(self.scrollView)
        self.view = view
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        self.view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[scrollView]-0-|",
                                                                options:NSLayoutFormatOptions(rawValue: 0),
                                                                metrics: nil,
                                                                views: ["scrollView":scrollView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[scrollView]-0-|",
                                                                    options:NSLayoutFormatOptions(rawValue: 0),
                                                                    metrics: nil,
                                                                    views: ["scrollView":scrollView]))
        
        
        
        super.updateViewConstraints()
    }
}

extension UserViewController:UserView{
    
    func presentUser(user: User) {
        
    }
}
