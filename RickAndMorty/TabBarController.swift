//
//  TabBarController.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 21.08.2024.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc2 = UINavigationController(rootViewController: FavoriteVC())
        let vc1 = UINavigationController(rootViewController: HomeVC())
        
        vc2.tabBarItem.image = UIImage(systemName: "heart.fill")
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        
        vc2.title = "Favorites"
        vc1.title = "Home"
        
        setViewControllers([vc1, vc2], animated: true)
        tabBar.tintColor = .black
        
    }
}
