//
//  ViewController.swift
//  HelloPassingValue
//
//  Created by denny on 10/3/16.
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
    @IBOutlet weak var myTextField: UITextField!
    
    @IBAction func gotoView2(_ sender: UIButton) {
        if let inputText = myTextField.text, inputText != "" {
            performSegue(withIdentifier: "gotoView2", sender: nil)
        }
        else{
            let myAlert = UIAlertController(title: "Please enter something", message: nil, preferredStyle: .alert)
            let myAction = UIAlertAction(title: "OK", style: .default, handler:nil)
            myAlert.addAction(myAction)
            present(myAlert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let des = segue.destination as? SecondViewController{
            des.textFromFirstView = myTextField.text
        }
    }
    
}
