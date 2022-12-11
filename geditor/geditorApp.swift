//
//  geditorApp.swift
//  geditor
//
//  Created by 陈辉 on 2022/12/9.
//

import SwiftUI
import AppTrackingTransparency

@main
struct geditorApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                // todo
//                let url = Bundle.main.url(forResource: "root_file", withExtension: "txt",subdirectory: "root")!
//                let item = FinderItem(url: url)
//                EditView(item:item)
                let url = Bundle.main.url(forResource: "root", withExtension: nil)!
                FinderListView(list: FinderList(url: url))
            }.onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) {
                _ in
                    ATTrackingManager.requestTrackingAuthorization { _ in
                        
                    }
            }
        }
    }
}
