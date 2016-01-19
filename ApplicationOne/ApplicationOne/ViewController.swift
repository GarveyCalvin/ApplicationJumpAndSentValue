//
//  ViewController.swift
//  ApplicationOne
//
//  Created by jiaweibai on 15/9/15.
//  Copyright (c) 2015年 GarveyCalvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func openApplication() {
        let urlSting = "GC://GarveyCalvin&GCFirst"
        if let url = NSURL(string: urlSting) {
            let application = UIApplication.sharedApplication()
            if application.canOpenURL(url) {
                application.openURL(url)
            }
        }
    }

}
