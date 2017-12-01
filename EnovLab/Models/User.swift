//
//  User.swift
//  EnovLab
//
//  Created by Charles Graffeo on 11/29/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

class User {

    let id:Int!
    let firstName:String!
    let lastName:String!
    let email:String!
    let gender:String!
    let avatarUrl:String!
    let jobTitle:String!
    let age:Int!
    let description:String!
    
    init(id:Int, firstName:String, lastName:String,email:String,gender:String,avatarUrl:String,jobTitle:String,age:Int,description:String) {
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.gender = gender
        self.avatarUrl = avatarUrl
        self.jobTitle = jobTitle
        self.age = age
        self.description = description
    }
    
    func fullname() -> String{
        return self.firstName + " " + self.lastName
    }
}
