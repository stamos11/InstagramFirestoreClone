//
//  User.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 12/4/24.
//

import Foundation

struct User {
    let email: String
    let fullname: String
    let profileImaageUrl: String
    let username: String
    let uid: String
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.profileImaageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
