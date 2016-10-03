//
//  ViewController.swift
//  HelloUINavigationController
//
//  Created by Denny on 2016/9/30.
//  Copyright © 2016年 Denny. All rights reserved.
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
    @IBAction func gotoView(_ sender: UIBarButtonItem) {
        let myStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let whiteViewController = myStoryBoard.instantiateViewController(withIdentifier: "whiteView")
        present(whiteViewController, animated:true, completion:nil)
    }

}

class SecondViewController : UIViewController{
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func goBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "Hello"
    }
}
