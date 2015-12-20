//
//  UserInfoModel.swift
//  SwiftDemo
//
//  Created by Easter on 12/20/15.
//  Copyright © 2015 Easter. All rights reserved.
//

import Foundation
class UserInfoModel {
    var userName: String?
    var userIdd: String?
    
    static func modelCustomPropertyMapper() -> NSDictionary {
        return ["userName": "userName", "userIdd": "userId"]
    }
}