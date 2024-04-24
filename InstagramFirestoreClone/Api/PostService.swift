//
//  PostService.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 22/4/24.
//

import UIKit
import Firebase


struct PostService {
    
    static func uploadPost(caption: String, image: UIImage, completion: @escaping(FirestoreCompletion)) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        print(uid)
        ImageUploader.uploadImage(image: image) { imageUrl in
            let data = [
                "caption": caption,
                "timestamp": Timestamp(date: Date()),
                "likes": 0,
                "imageUrl": imageUrl,
                "ownerUid": uid] as [String: Any]
            
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
}
