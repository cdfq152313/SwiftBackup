//
//  ViewController.swift
//  HelloGCD
//
//  Created by denny on 10/14/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DispatchQueue.main.sync(execute:task1)
        // DispatchQueue.main.async(execute:task1)
        // DispatchQueue.main.async(execute:task2)
        
        DispatchQueue.global().async(execute: task1)
        DispatchQueue.global(qos: .background).async(execute:task2)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    let task1 = {
        for i in 1...5{
            print("Task1 : \(i)")
        }
    }
    let task2 = {
        for i in 1...5{
            print("Task2 : \(i)")
        }
    }
    
}

