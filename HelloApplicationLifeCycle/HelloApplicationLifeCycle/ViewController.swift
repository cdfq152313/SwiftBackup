//
//  ViewController.swift
//  HelloApplicationLifeCycle
//
//  Created by Denny on 2016/9/26.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("ViewController: viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("ViewController: didReceiveMemoryWarning")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("ViewController: viewDidAppear")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("ViewController: viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewController: viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewController: viewDidDisappear")
    }
    
}

