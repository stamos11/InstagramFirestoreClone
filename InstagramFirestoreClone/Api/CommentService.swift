//
//  CommentService.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 6/5/24.
//

import Firebase

struct CommentService {
    
    static func uploadComment(comment: String, postId: String, user: User, completion: @escaping(FirestoreCompletion)) {
        let data: [String: Any] = ["uid": user.uid,
                                   "comment": comment,
                                   "timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "profileImageUrl": user.profileImageUrl]
        
        COLLECTION_POSTS.document(postId).collection("comments").addDocument(data: data, completion: completion)
    }
    
    static func fetchComnments() {
        
    }
}
