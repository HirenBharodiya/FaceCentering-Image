//
//  AppDelegate.swift
//  test
//
//  Created by Hiren on 01/11/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationViewController : UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let VC = TestViewController(nibName: "TestViewController", bundle: nil)
        self.navigationViewController?.pushViewController(VC, animated: true)
        self.window?.rootViewController = VC
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

