//
//  MainTabController.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 6/3/24.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        checkIfUserIsLoggedIn()
//        logout()
    }
    // MARK: -API
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG:A Failed to sign out")
        }
    }
    
    // MARK: Helpers
    
    func configureViewController() {
        view.backgroundColor = .white
        tabBar.backgroundColor = .gray
        tabBar.tintColor = .black
        
        let layout = UICollectionViewFlowLayout()
        let feed = templateNavigationController(unselectedImage: UIImage(imageLiteralResourceName: "home_unselected"), selectedImage: UIImage(imageLiteralResourceName: "home_selected"), rootViewController: FeedController(collectionViewLayout: layout))
        let search = templateNavigationController(unselectedImage: UIImage(imageLiteralResourceName: "search_unselected"), selectedImage: UIImage(imageLiteralResourceName: "search_selected"), rootViewController: SearchController())
        let imageSelector = templateNavigationController(unselectedImage: UIImage(imageLiteralResourceName: "plus_unselected"), selectedImage: UIImage(imageLiteralResourceName: "plus_unselected"), rootViewController: ImageSelectorController())
        let notification = templateNavigationController(unselectedImage: UIImage(imageLiteralResourceName: "like_unselected"), selectedImage: UIImage(imageLiteralResourceName: "like_selected"), rootViewController: NotificationsController())
        
        let profileLayout = UICollectionViewLayout()
        let profile = templateNavigationController(unselectedImage: UIImage(imageLiteralResourceName: "profile_unselected"), selectedImage: UIImage(imageLiteralResourceName: "profile_selected"), rootViewController: ProfileController(collectionViewLayout: layout))
        
        
        viewControllers = [feed, search, imageSelector, notification, profile]
        
        tabBar.tintColor = .black
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        nav.isToolbarHidden = false
        nav.navigationBar.prefersLargeTitles = true
        return nav
    }
}
