//
//  AppDelegate.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit
import Pulley
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        let mainVC = UINavigationController(rootViewController: MainViewController())
        let mainVC = MainViewController()

        let merchantVC = UINavigationController(rootViewController: MerchantsViewController())
//        let merchantVC = MerchantsViewController()
        
        let pulleyVC = PulleyViewController(contentViewController: mainVC, drawerViewController: merchantVC)
//        window?.rootViewController = UINavigationController(rootViewController: pulleyVC)
        
        window?.rootViewController = UINavigationController(rootViewController: ScheduleApptViewController())
        window?.makeKeyAndVisible()
        
        return true
    }


}

