//
//  ViewController.swift
//  HelloUserDefault
//
//  Created by denny on 10/7/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func save(){
        var toDo = ["Buy milk", "iOS exam", "Sleep", "Make money"]
        UserDefaults.standard.set(toDo, forKey:"todo")
        UserDefaults.standard.synchronize()
    }
    
    func load(){
        guard let loaded = UserDefaults.standard.object(forKey: "toDo") as? [String] else{
            print("No such key")
            return
        }
        print(loaded)
    }
}

