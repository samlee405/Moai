//
//  User.swift
//  Support
//
//  Created by Sam Lee on 2/18/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import Foundation

class User {
    
    enum userType {
        case patient
        case support
        case physician
    }
    
    var type: userType?
    var name: String?
    var username: String?
    var description: String?
//    var profileImage: UIImage?
    
    var supportNetwork = [User]()
    
    init(type: userType, name: String, username: String, description: String?) {
        self.type = type
        self.name = name
        self.username = username
        self.description = description
        
        uploadUser()
    }
    
    func uploadUser() {
        // store user info in backend
    }
}
