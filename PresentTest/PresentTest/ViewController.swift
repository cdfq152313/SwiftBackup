//
//  ViewController.swift
//  PresentTest
//
//  Created by denny on 10/28/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func navigate(_ sender: AnyObject) {
        let navigation = self.tabBarController?.viewControllers?[0] as! UINavigationController
        let controller = navigation.viewControllers[0] as! ViewController1
        controller.myLabel.text = "HEEEEEEEE"
    }

    @IBOutlet weak var navigate: UIButton!
    @IBAction func code(_ sender: AnyObject) {
        let controller = ViewController()
        controller.view.backgroundColor = UIColor.blue
        present(controller, animated: true, completion: nil)
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

