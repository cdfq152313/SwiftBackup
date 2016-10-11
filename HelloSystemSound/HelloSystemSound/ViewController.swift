//
//  ViewController.swift
//  HelloSystemSound
//
//  Created by denny on 10/6/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit
import AudioToolbox
class ViewController: UIViewController {

    @IBAction func play(_ sender: UIButton) {
        AudioServicesPlaySystemSound(1000)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

