//
//  UserInfoModel.swift
//  SwiftDemo
//
//  Created by Easter on 12/20/15.
//  Copyright © 2015 Easter. All rights reserved.
//

import Foundation
import ObjectMapper

class UserInfoModel {
    var userName: String?
    var userId: String?
    
    init(dictionary: Dictionary<String, AnyObject>) {
        userName = dictionary["userName"] as? String
        userId = dictionary["userId"] as? String
    }
}