//
//  WebService.swift
//  SwiftDemo
//
//  Created by Easter on 12/20/15.
//  Copyright © 2015 Easter. All rights reserved.
//

import Foundation
import ObjectMapper

class WebService: AFHTTPSessionManager {
    static let sharedInstance = WebService()
    
    static let ServiceBaseUrl = "http://gateway.lincovip.com"
    static let PathSignIn = "/api/mobileteachers/tencent"
    static let PathGetAllCourses = "/api/allStudentAppAndQuickMatch?teacherId=%@"
    
    var user: UserInfoModel?
    
    func signIn(userName: String, passWord: String, completion:(success: Bool) -> Void) {
        print("Sign in with username: \(userName) password: \(passWord)")
        let params = ["username": userName, "password": passWord]
        let path = WebService.ServiceBaseUrl + WebService.PathSignIn
        
        self.POST(path, parameters: params, success: {(task: NSURLSessionDataTask, responseObject: AnyObject?) -> Void in
            print("succeeded signing in with userName: \(userName) response: \(responseObject)")
            AppSettings.sharedInstance.username = userName
            AppSettings.sharedInstance.password = passWord
            self.user = Mapper<UserInfoModel>().map(responseObject)
            completion(success: true)
        }, failure: {(task: NSURLSessionDataTask?, error: NSError) -> Void in
            let alertView = UIAlertView(title: "Unable to sign in", message: "", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
            completion(success: false)
        })
    }
    
    func getAllCourses(completion:(success: Bool) -> Void) {
        if let userId = user?.userId {
            let path = String(format: WebService.ServiceBaseUrl + WebService.PathGetAllCourses, userId)
            self.GET(path, parameters: nil, success: {(task: NSURLSessionDataTask, responseObject: AnyObject?) -> Void in
                completion(success: true)
            }, failure: {(task: NSURLSessionDataTask?, error: NSError) -> Void in
                completion(success: false)
            })
        }
    }
}
