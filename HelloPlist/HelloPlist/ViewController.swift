//
//  ViewController.swift
//  HelloPlist
//
//  Created by denny on 10/7/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        readPlist()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func readPlist(){
        guard let scorePlist = Bundle.main.path(forResource: "Score", ofType: "plist"),
         let scoreArray = NSArray(contentsOfFile: scorePlist) else{
            print("Get Plist Error")
            return
        }
        
        print(scoreArray)
    }

}

