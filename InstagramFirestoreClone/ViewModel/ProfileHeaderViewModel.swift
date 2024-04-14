//
//  ProfileHeaderViewModel.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 13/4/24.
//

import Foundation

struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String {
        return user.fullname
    }
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    init(user: User) {
        self.user = user
    }
}
