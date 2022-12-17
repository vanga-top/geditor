//
//  AppDelegate.swift
//  geditor
//
//  Created by 陈辉 on 2022/12/9.
//

import UIKit

class AppDelegate : NSObject,UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            if Settings.shared.firstLaunch {
                FinderList.createExamples()
                Settings.shared.firstLaunch = false
            }
        return true
    }
}
