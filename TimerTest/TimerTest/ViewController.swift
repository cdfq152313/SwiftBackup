//
//  ViewController.swift
//  TimerTest
//
//  Created by denny on 11/4/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func move(_ sender: AnyObject) {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {(timer) -> Void in
            self.imageView.frame = self.imageView.frame.offsetBy(dx: 1, dy: 1)
            if self.imageView.frame.origin.x > 300 {
                timer.invalidate()
            }
        })
    }
}

