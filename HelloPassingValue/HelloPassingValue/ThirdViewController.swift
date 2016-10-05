//
//  ThirdViewController.swift
//  HelloPassingValue
//
//  Created by denny on 10/4/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.post(
            Notification(name: Notification.Name("view3notification"), object: nil, userInfo: ["color":"cyan"])
        )
    }
    

}
