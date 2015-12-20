//
//  AppSettings.swift
//  SwiftDemo
//
//  Created by Easter on 12/20/15.
//  Copyright © 2015 Easter. All rights reserved.
//

import Foundation



class AppSettings {
    static let sharedInstance = AppSettings()
    static let KeyUserName = "KeyUserName"
    static let KeyPassWord = "KeyPassWord"
    
    var username: String? {
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: AppSettings.KeyUserName)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        get {
            return NSUserDefaults.standardUserDefaults().stringForKey(AppSettings.KeyUserName)
        }
    }
    var password: String? {
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: AppSettings.KeyPassWord)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        get {
            return NSUserDefaults.standardUserDefaults().stringForKey(AppSettings.KeyPassWord)
        }
    }
    
}
