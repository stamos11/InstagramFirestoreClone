//
//  UserService.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 12/4/24.
//

import Firebase


struct UserService {
    
    static func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else {return}
            let user = User(dictionary: dictionary)
            completion(user)
            print(user)
        }
    }
    
}
