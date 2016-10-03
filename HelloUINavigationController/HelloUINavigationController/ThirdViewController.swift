//
//  ThirdViewController.swift
//  HelloUINavigationController
//
//  Created by denny on 10/3/16.
//  Copyright © 2016 Denny. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBAction func gotoView4(_ sender: UIButton) {
        performSegue(withIdentifier: "goToViewFourth", sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.brown
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
