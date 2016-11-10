//
//  ViewController.swift
//  LocaliztionTest
//
//  Created by Denny on 10/11/2016.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rabaca: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rabaca.text = NSLocalizedString("REBECCAAAAAAAAAA", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

