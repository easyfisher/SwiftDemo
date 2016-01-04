//
//  UserInfoModel.swift
//  SwiftDemo
//
//  Created by Easter on 12/20/15.
//  Copyright © 2015 Easter. All rights reserved.
//

import Foundation
import ObjectMapper

class UserInfoModel: Mappable {
    var userName: String?
    var userIdd: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        userName    <- map["userName"]
        userIdd     <- map["userId"]
    }
}