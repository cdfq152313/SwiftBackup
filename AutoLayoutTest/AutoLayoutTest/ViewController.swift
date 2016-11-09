//
//  ViewController.swift
//  AutoLayoutTest
//
//  Created by Denny on 9/11/2016.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var judy: UILabel!
    @IBOutlet weak var nick: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dislike.removeFromSuperview()
    }

    @IBOutlet weak var dislike: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

