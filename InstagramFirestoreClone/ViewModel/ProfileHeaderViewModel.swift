//
//  ProfileHeaderViewModel.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 13/4/24.
//

import Foundation
import UIKit

struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String {
        return user.fullname
    }
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    var followButtonText: String {
        if user.isCurrentUser {
            return "Edit profile"
        }
        return user.isFollowed ? "Following" : "Follow"
    }
    var followButtonBackgroundColor: UIColor {
        return user.isCurrentUser ? .white : .systemBlue
    }
    var followbuttonTextColor: UIColor {
        return user.isCurrentUser ? .black : .white
    }
    var numberOfFollowers: NSAttributedString {
        return attributedStatText(value: user.stats.followers, label: "followers")
    }
    var numberOfFollowing: NSAttributedString {
        return attributedStatText(value: user.stats.following, label: "following")
    }
    var numberOfPosts: NSAttributedString {
        return attributedStatText(value: 5, label: "posts")
    }
    
    init(user: User) {
        self.user = user
    }
    func attributedStatText(value: Int, label: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        
        let valueAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.black]
        let valueText = NSAttributedString(string: "\(value)\n", attributes: valueAttributes)
        attributedString.append(valueText)
        let labelAttributes : [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]
        let labelText = NSAttributedString(string: label, attributes: labelAttributes)
        attributedString.append(labelText)
        return attributedString

    }
}
