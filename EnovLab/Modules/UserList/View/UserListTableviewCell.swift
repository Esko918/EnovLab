//
//  UserListTableviewCellTableViewCell.swift
//  EnovLab
//
//  Created by Charles Graffeo on 12/1/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit
import AlamofireImage

class UserListTableviewCell: UITableViewCell {

    var name:UILabel!
    var jobTitle:UILabel!
    var avatar:UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.black
        
        self.name = UILabel(frame: .zero)
        self.name.backgroundColor = self.contentView.backgroundColor
        self.name.translatesAutoresizingMaskIntoConstraints = false
        self.name.textColor = UIColor.white
        self.contentView.addSubview(self.name)
        
        self.jobTitle = UILabel(frame: .zero)
        self.jobTitle.translatesAutoresizingMaskIntoConstraints = false
        self.jobTitle.backgroundColor = self.contentView.backgroundColor
        self.jobTitle.textColor = UIColor.gray
        self.contentView.addSubview(self.jobTitle)
        
        self.avatar = UIImageView(frame: .zero)
        self.avatar.contentMode = .scaleAspectFill
        self.avatar.translatesAutoresizingMaskIntoConstraints = false
        self.avatar.backgroundColor = self.contentView.backgroundColor
        self.contentView.addSubview(self.avatar)
        
        self.setNeedsUpdateConstraints()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        //Imageview Constraints
        self.contentView.addConstraint(NSLayoutConstraint(item: self.avatar,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: self.contentView,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 10))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.avatar,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: self.contentView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 10))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.avatar,
                                                          attribute: .width,
                                                          relatedBy: .equal,
                                                          toItem: nil,
                                                          attribute: .notAnAttribute,
                                                          multiplier: 1.0,
                                                          constant: 50))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.avatar,
                                                          attribute: .height,
                                                          relatedBy: .equal,
                                                          toItem: nil,
                                                          attribute: .notAnAttribute,
                                                          multiplier: 1.0,
                                                          constant: 50))
        
        
        //Name Constraints
        self.contentView.addConstraint(NSLayoutConstraint(item: self.name,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: self.avatar,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 0))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.name,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: self.avatar,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: 10))
        
        //Job title Constraints
        
        self.contentView.addConstraint(NSLayoutConstraint(item: self.jobTitle,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: self.name,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 0))
        
        self.contentView.addConstraint(NSLayoutConstraint(item: self.jobTitle,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: self.name,
                                                          attribute: .bottom,
                                                          multiplier: 1.0,
                                                          constant: 10))
        
        
        super.updateConstraints()
    }
    
}
