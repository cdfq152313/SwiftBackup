//
//  ViewController.swift
//  PlayGroundLikeTest
//
//  Created by denny on 10/26/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("=== before test ===")
        test5()
        print("=== after test ===")
    }
    
    func test(){
        var cuteDog:Dog? = Dog("Dog1")
        cuteDog?.eat()
        print("Bye Bye Dog")
    }
    
    func test2(){
        let baby = Baby("PeterPan")
        baby.dog = Dog("PeterPan's Dog")
        print("Hello Baby")
    }
    
    func test3(){
        var cuteBaby1:Baby? = Baby("andy")
        cuteBaby1?.dog = Dog("tony")
        
        var cuteBaby2:Baby? = Baby("jeff")
        cuteBaby2?.dog = cuteBaby1?.dog
        cuteBaby1 = nil
    }
    
    func test4(){
        var dog = Dog("dog")
        var baby = Baby("baby")
        dog.baby = baby
        baby.dog = dog
    }
    
    func test5(){
        var cuteRabbit:Rabbit? = Rabbit(name: "peter pan")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
