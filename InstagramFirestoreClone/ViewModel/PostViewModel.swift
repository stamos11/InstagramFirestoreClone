//
//  PostViewModel.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 24/4/24.
//

import UIKit

struct PostViewModel {
    
    var post: Post
    
    var imageUrl: URL? {
        return URL(string: post.imageUrl)
    }
    var userProfileImageUrl: URL? { return URL(string: post.ownerImageUrl)
    }
    var username: String {
        return post.ownerUsername
    }
    var caption: String {
        return post.caption
    }
    var likes: Int {
        return post.likes
    }
    var likeButtonTintColor: UIColor {
        return post.didLike ? .red : .black
    }
    var likeButtonImage: UIImage? {
        let imageName = post.didLike ? "like_selected" : "like_unselected"
        return UIImage(imageLiteralResourceName: imageName)
    }
    var likesLabelText: String {
        if post.likes != 1 {
            return "\(post.likes) likes"
        } else {
            return "\(post.likes) like"
        }
    }
    var timeStampString: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .full
        return formatter.string(from: post.timestamp.dateValue(), to: Date())
    }
    
    init(post: Post) {
        self.post = post
    }
}
