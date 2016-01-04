//
//  CourseCell.swift
//  SwiftDemo
//
//  Created by Easter on 1/4/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clearColor()
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
