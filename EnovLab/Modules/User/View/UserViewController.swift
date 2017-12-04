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
        view.backgroundColor = UIColor.white
        self.scrollView = UIScrollView()
        self.scrollView.backgroundColor = view.backgroundColor
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.nameLbl.translatesAutoresizingMaskIntoConstraints = false
        self.nameLbl.backgroundColor = view.backgroundColor
        
        self.emailLbl.translatesAutoresizingMaskIntoConstraints = false
        self.emailLbl.backgroundColor = view.backgroundColor
        
        self.genderLbl.translatesAutoresizingMaskIntoConstraints = false
        self.genderLbl.backgroundColor = view.backgroundColor
        
        self.jobTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        self.jobTitleLbl.backgroundColor = view.backgroundColor
        
        self.ageLbl.translatesAutoresizingMaskIntoConstraints = false
        self.ageLbl.backgroundColor = view.backgroundColor
        
        self.avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        self.avatarImageView.backgroundColor = view.backgroundColor
        
        self.descriptionLbl.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLbl.backgroundColor = view.backgroundColor
        self.descriptionLbl.numberOfLines = 0
        self.descriptionLbl.lineBreakMode = .byWordWrapping
        
        view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.nameLbl)
        self.scrollView.addSubview(self.emailLbl)
        self.scrollView.addSubview(self.genderLbl)
        self.scrollView.addSubview(self.jobTitleLbl)
        self.scrollView.addSubview(self.ageLbl)
        self.scrollView.addSubview(self.avatarImageView)
        self.scrollView.addSubview(self.descriptionLbl)
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
        
        //Avatar Constraints
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.avatarImageView,
                                                              attribute: .top,
                                                              relatedBy: .equal,
                                                              toItem: self.scrollView,
                                                              attribute: .top,
                                                              multiplier: 1.0,
                                                              constant: 10))
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.avatarImageView,
                                                              attribute: .centerX,
                                                              relatedBy: .equal,
                                                              toItem: self.scrollView,
                                                              attribute: .centerX,
                                                              multiplier: 1.0,
                                                              constant: 0))
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.avatarImageView,
                                                              attribute: .height,
                                                              relatedBy: .equal,
                                                              toItem: nil,
                                                              attribute: .notAnAttribute,
                                                              multiplier: 1.0,
                                                              constant: 50))
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.avatarImageView,
                                                              attribute: .width,
                                                              relatedBy: .equal,
                                                              toItem: nil,
                                                              attribute: .notAnAttribute,
                                                              multiplier: 1.0,
                                                              constant: 50))
        
        //Name Constraints
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.nameLbl,
                                                              attribute: .top,
                                                              relatedBy: .equal,
                                                              toItem: self.avatarImageView,
                                                              attribute: .bottom,
                                                              multiplier: 1.0,
                                                              constant: 10))
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.nameLbl,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: self.scrollView,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 10))
        
        //Email Constraints
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.emailLbl,
                                                              attribute: .top,
                                                              relatedBy: .equal,
                                                              toItem: self.nameLbl,
                                                              attribute: .bottom,
                                                              multiplier: 1.0,
                                                              constant: 10))
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.emailLbl,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: self.nameLbl,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 0))
        
        //Gender Constraints
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.genderLbl,
                                                              attribute: .top,
                                                              relatedBy: .equal,
                                                              toItem: self.emailLbl,
                                                              attribute: .bottom,
                                                              multiplier: 1.0,
                                                              constant: 10))
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.genderLbl,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: self.emailLbl,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 0))
        
        //Job title Constraints
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.jobTitleLbl,
                                                              attribute: .top,
                                                              relatedBy: .equal,
                                                              toItem: self.genderLbl,
                                                              attribute: .bottom,
                                                              multiplier: 1.0,
                                                              constant: 10))
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.jobTitleLbl,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: self.genderLbl,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 0))
        
        //Age Constraints
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.ageLbl,
                                                              attribute: .top,
                                                              relatedBy: .equal,
                                                              toItem: self.jobTitleLbl,
                                                              attribute: .bottom,
                                                              multiplier: 1.0,
                                                              constant: 10))
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.ageLbl,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: self.jobTitleLbl,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 0))
        
        //Description title Constraints
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.descriptionLbl,
                                                              attribute: .top,
                                                              relatedBy: .equal,
                                                              toItem: self.ageLbl,
                                                              attribute: .bottom,
                                                              multiplier: 1.0,
                                                              constant: 10))
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.descriptionLbl,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: self.ageLbl,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 0))
        
        self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.descriptionLbl,
                                                              attribute: .width,
                                                              relatedBy: .equal,
                                                              toItem: self.scrollView,
                                                              attribute: .width,
                                                              multiplier: 1.0,
                                                              constant: -20))
        
        
        
        super.updateViewConstraints()
    }
}

extension UserViewController:UserView{
    
    func presentUser(user: User) {
        
        self.title = user.fullname()
        self.avatarImageView.af_setImage(withURL: URL(string: user.avatarUrl)!)
        self.nameLbl.text = user.fullname()
        self.emailLbl.text = user.email
        self.genderLbl.text = user.gender
        self.jobTitleLbl.text = user.jobTitle
        self.ageLbl.text = String(user.age)
        self.descriptionLbl.text = user.description
        
    }
}
