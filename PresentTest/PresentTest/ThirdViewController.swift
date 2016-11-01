//
//  ThirdViewController.swift
//  PresentTest
//
//  Created by denny on 10/28/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBAction func next(_ sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "fourth")
        self.present(controller!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
