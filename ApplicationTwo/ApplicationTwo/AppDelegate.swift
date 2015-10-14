//
//  AppDelegate.swift
//  ApplicationTwo
//
//  Created by jiaweibai on 15/9/15.
//  Copyright (c) 2015年 GarveyCalvin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        let newUrlHost = url.absoluteString ?? ""
        jump(newUrlHost)
        
        return false
    }
    
    func jump(urlHost: NSString) {
        // Alert params
        let range = urlHost.rangeOfString("//")
    
        var alertView: UIAlertView
        if range.length != NSNotFound {
            let params = urlHost.substringFromIndex(range.length + range.location)
            alertView = UIAlertView(title: "params is \(params) \n and Returns automatically after 3 seconds", message: nil, delegate: nil, cancelButtonTitle: "Confirm")
            alertView.show()
        } else {
            alertView = UIAlertView(title: "haven't params", message: nil, delegate: nil, cancelButtonTitle: "Confirm")
            alertView.show()
        }
        
        // Reverse
        let protocolFromAppRange = urlHost.rangeOfString("&")
        if protocolFromAppRange.length != NSNotFound {
            let protocolUrl = urlHost.substringFromIndex(protocolFromAppRange.length + protocolFromAppRange.location)
            
            // Timer
            let time = 3.0
            let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(UInt64(time) * NSEC_PER_SEC))
            dispatch_after(delay, dispatch_get_main_queue()) { () -> Void in
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                
                let urlSting = "\(protocolUrl)://"
                if let url = NSURL(string: urlSting) {
                    let application = UIApplication.sharedApplication()
                    if application.canOpenURL(url) {
                        application.openURL(url)
                    }
                }
            }
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

