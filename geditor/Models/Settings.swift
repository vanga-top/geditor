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
        static let FONT_NAME = "fontName"
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
    
    var fontName: String {
        get {
            UserDefaults.standard.string(forKey: keys.FONT_NAME) ?? "CourierNewPSMT"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: keys.FONT_NAME)
        }
    }
    
    var fontSize: CGFloat {
        get {
            if let _ = UserDefaults.standard.value(forKey: keys.FONT_SIZE) {
                return CGFloat(UserDefaults.standard.float(forKey: keys.FONT_SIZE))
            } else {
                return UIFont.systemFontSize
            }
        }
        set {
            UserDefaults.standard.set(newValue, forKey: keys.FONT_SIZE)
        }
    }
    
    var textColor: Color {
        get {
            guard
                let components = UserDefaults.standard.array(forKey: keys.TEXT_COLOR) as? [CGFloat],
                let cgColor = CGColor(
                    colorSpace: CGColorSpace(name: CGColorSpace.sRGB)!, components: components)
            else {
                return Color("Text")
            }
            return Color(cgColor: cgColor)
        }
        set {
            UserDefaults.standard.set(newValue.cgColor?.components ?? [], forKey: keys.TEXT_COLOR)
        }
    }
    
    
    var backgroundColor: Color {
        get {
            guard
                let components = UserDefaults.standard.array(forKey: keys.BACKGROUND_COLOR)
                    as? [CGFloat],
                let cgColor = CGColor(colorSpace: CGColorSpace(name: CGColorSpace.sRGB)!, components: components)
            else {
                return  Color("Background")
            }
            return Color(cgColor: cgColor)
        }
        set {
            UserDefaults.standard.set(newValue.cgColor?.components ?? [], forKey: keys.BACKGROUND_COLOR)
        }
    }
}
