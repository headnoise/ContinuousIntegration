//
//  AppDelegate.swift
//  ContinuousIntegration
//
//  Created by Maximilian Sonntag on 4/23/19.
//  Copyright © 2019 Sonntag. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        FirebaseApp.configure()
        
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        let vc = PhotoListViewController()
        let root = UINavigationController(rootViewController: vc)
        window?.rootViewController = root
        window?.makeKeyAndVisible()
    }
}

