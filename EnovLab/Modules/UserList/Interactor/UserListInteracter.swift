//
//  UserListInteracter.swift
//  EnovLab
//
//  Created by Charles Graffeo on 11/29/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

class UserListInteracter: UsersListCase {
    
    var output: UserListInteracterOutput!
    
    // MARK: User List Case
    func fetchUsers() {
        
        if let jsonArray = self.userListData(){
            
            let userList = self.convertJsonToUsers(userList: jsonArray)
            self.output.usersFetched(userList)
            
        }
        else{
            print("User List Data Not Found")
            
        }
    }
    
    // MARK: Private
    
    private func userListFilepath() -> URL?{
        return Bundle.main.url(forResource: "users", withExtension: "json")
    }
    
    private func userListData()->Array<Dictionary<String,AnyObject>>?{
        
        do{
            let data = try Data(contentsOf: self.userListFilepath()!)
            let jsonArray = try JSONSerialization.jsonObject(with: data, options:[])
            return jsonArray as? Array<Dictionary<String,AnyObject>>
        }
        catch(let error){
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    private func convertJsonToUsers(userList:Array<Dictionary<String,AnyObject>>) -> [User]{
        
        var users = [User]()
        for user in userList{
            
            let u = User(id: user["id"] as! Int,
                         firstName: user["first_name"] as! String,
                         lastName: user["last_name"] as! String,
                         email: user["email"]  as! String,
                         gender: user["gender"]  as! String,
                         avatarUrl: user["avatar"]  as! String,
                         jobTitle: user["job_title"]  as! String,
                         age: user["age"]  as! Int,
                         description: user["desc"]  as! String)
            
            users.append(u)
            
        }
        return users
        
    }
    
}
