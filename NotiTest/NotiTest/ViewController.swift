//
//  ViewController.swift
//  NotiTest
//
//  Created by denny on 10/19/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBAction func localAction(_ sender: AnyObject) {
        let localNoti = UILocalNotification()
        let now = Date()
        let notiDate = now.addingTimeInterval(10)
        localNoti.fireDate = notiDate
        localNoti.alertBody = "Oh my goodness. Oh my dame."
        localNoti.soundName = UILocalNotificationDefaultSoundName
        localNoti.applicationIconBadgeNumber = 1
        UIApplication.shared.scheduleLocalNotification(localNoti)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

