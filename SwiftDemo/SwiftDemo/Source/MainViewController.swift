//
//  MainViewController.swift
//  SwiftDemo
//
//  Created by Easter on 12/20/15.
//  Copyright © 2015 Easter. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    static let sharedInstance = MainViewController()
    
    var launchNavigationController: UINavigationController?
    var homeViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if launchNavigationController == nil {
            launchNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("launchNavigationController") as! UINavigationController
        }
        self.view.addSubview((launchNavigationController!.view))
    }

    func showHomeView() {
        if launchNavigationController != nil {
            launchNavigationController!.view.removeFromSuperview()
            launchNavigationController = nil
        }
        
        if homeViewController == nil {
            homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("homeViewController") as! UIViewController
        }
        self.view.addSubview(homeViewController!.view)
    }
}
