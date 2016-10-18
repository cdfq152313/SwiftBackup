//
//  ViewController.swift
//  HelloJson
//
//  Created by denny on 10/14/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let somePerson = Person(name: "David", email: "abc@yahoo.com", number: "123-456-789", image: "http://jjj.jpg")
        setInfo(person: somePerson)
    }
    
    func setInfo(person:Person){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

