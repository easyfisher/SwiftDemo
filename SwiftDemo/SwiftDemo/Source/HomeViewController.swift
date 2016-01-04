//
//  HomeViewController.swift
//  SwiftDemo
//
//  Created by Easter on 12/20/15.
//  Copyright © 2015 Easter. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    static let CellIdentifier = "CourseCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        setUpTableView()
        loadData()
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = nil
        tableView.backgroundColor = UIColor.clearColor()
        tableView.tableHeaderView?.frame.size.height = self.view.bounds.width * 120/320
        
        tableView.registerNib(UINib(nibName: "CourseCell", bundle: nil), forCellReuseIdentifier: HomeViewController.CellIdentifier)
    }
    
    func loadData() {
        WebService.sharedInstance.getAllCourses() { success in
            
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(HomeViewController.CellIdentifier, forIndexPath: indexPath)
        return cell
    }

    @IBAction func onlineButtonDidTap(sender: AnyObject) {
        if let button = sender as? UIButton {
            if button.titleLabel!.text == "Put me online" {
                button.setTitle("Put me offline", forState: .Normal)
            } else {
                button.setTitle("Put me online", forState: .Normal)
            }
        }
    }
}
