//
//  ViewController.swift
//  Ebook
//
//  Created by Denny on 2016/9/21.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myvar:String?
    @IBOutlet weak var mylabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(myvar != nil){
            mylabel.text = myvar
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

