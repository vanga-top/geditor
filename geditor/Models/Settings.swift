//
//  Settings.swift
//  geditor
//
//  Created by 陈辉 on 2022/12/9.
//

import UIKit
import SwiftUI


class Settings {
    private init(){}
    
    static let shared = Settings()
    
    struct keys {
        static let FIRST_LAUNCH = "firstLaunch"
        static let  KEYBOARD_ACCESSORY  = "keyboardAccessory"
        static let FONT_SIZE = "fontSize"
        static let TEXT_COLOR = "textColor"
        static let BACKGROUND_COLOR = "backgroundColor"
    }
    
    var firstLaunch:Bool {
        get{
            if let _ = UserDefaults.standard.value(forKey: keys.FIRST_LAUNCH){
                return UserDefaults.standard.bool(forKey: keys.FIRST_LAUNCH)
            }else{
                return true
            }
        }
        set {
            UserDefaults.standard.set(newValue, forKey: keys.FIRST_LAUNCH)
        }
    }
    
}
