//
//  AppDelegate.swift
//  PrayerTime
//
//  Created by Mavlon on 01/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.rootViewController = TabBar()
        window?.makeKeyAndVisible()
        
        return true
    }

}

