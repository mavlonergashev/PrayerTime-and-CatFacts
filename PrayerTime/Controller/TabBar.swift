//
//  TabBar.swift
//  PrayerTime
//
//  Created by Mavlon on 01/04/22.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .white
        
        let vc1 = MainVC(nibName: "MainVC", bundle: nil)
        let navVC1 = UINavigationController(rootViewController: vc1)
        let tabBarItem1 = UITabBarItem(title: "Main Menu", image: UIImage(systemName: "house"), selectedImage: nil)
        navVC1.tabBarItem = tabBarItem1
        
        let vc2 = SettingsVC(nibName: "SettingsVC", bundle: nil)
        let navVC2 = UINavigationController(rootViewController: vc2)
        let tabBarItem2 = UITabBarItem(title: "Settings", image: UIImage(systemName: "circle"), selectedImage: nil)
        navVC2.tabBarItem = tabBarItem2

        viewControllers = [navVC1,navVC2]
        
    }
    

}
