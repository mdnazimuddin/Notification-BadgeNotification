//
//  ViewController.swift
//  BadgeNumber
//
//  Created by Nazim Uddin on 7/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    let textLabel:UILabel = {
        let label = UILabel()
        label.text = "Badge Notification"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var badgeNumber:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTextLabelConstraint()
        
        //Badge Notification Setup
        badgeNumber = 5
        self.stupBadgeNotification()
        
    }
    func stupBadgeNotification()
    {
        let application = UIApplication.shared
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .alert, .sound]) { (succes, error) in
            print("Success")
        }
        application.applicationIconBadgeNumber = badgeNumber
        application.registerForRemoteNotifications()
    }
    
    func setupTextLabelConstraint()
    {
        view.addSubview(textLabel)
        
        // need x, y, width, height Anchors
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }


}

