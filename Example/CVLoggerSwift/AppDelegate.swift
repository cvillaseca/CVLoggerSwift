//
//  AppDelegate.swift
//  CVLoggerSwift
//
//  Created by Cristian Villaseca on 05/04/2016.
//  Copyright (c) 2016 Cristian Villaseca. All rights reserved.
//

import UIKit
import CVLoggerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var cvlogger: CVLogger?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        UINavigationBar.appearance().tintColor = UIColor.init(colorLiteralRed: 45.0/255.0, green: 149.0/255.0, blue: 206.0/255.0, alpha: 1)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateInitialViewController()
        
        if window != nil {
            window = UIWindow(frame: UIScreen.mainScreen().bounds)
            window?.rootViewController = mainVC
            window?.makeKeyAndVisible()
        }
        
        #if DEBUG
            cvlogger = CVLogger()
        #endif
        
        for _ in 0...10 {
            
            CVLogger.print("Lorem ipsum dolor sit amet, at ridiculus fringilla tristique, ante commodo sed, commodo condimentum turpis, quam euismod praesent tincidunt. Erat vestibulum dui auctor dictumst sem in, ullamcorper sed morbi magna et suscipit dolore, consequatur ante laoreet, nisl eget. Sociis libero et sed euismod. Quis dictum lacus in quam, est duis integer pede facilisis mauris. In nec egestas lorem in morbi platea, enim aliquam consequat, cursus saepe blanditiis, ut risus malesuada quisque ornare ornare iaculis. Adipiscing dolor sed sed ut netus, ut at aenean interdum. Ligula sed adipiscing, adipiscing nisl pede eget adipisicing mauris proin, ac quam dui suspendisse diam ultrices massa. A a odio volutpat auctor.")
        }
        CVLogger.print("last log entry")
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
    }
    
    func applicationWillTerminate(application: UIApplication) {
    }
    
    
}

