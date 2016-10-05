//
//  ViewController.swift
//  HelloPassingValue
//
//  Created by denny on 10/3/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController , SecondViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.gotNotification(notification:)), name: Notification.Name("view2notification"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.gotAnotherNotif(notification:)), name: Notification.Name.UIKeyboardDidShow, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            if let colorName = appDelegate.color{
                setColor(colorType: colorName)
            }
        }
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
            des.delegate = self
            des.textFromFirstView = myTextField.text
        }
    }
    
    func setColor(colorType: String) {
        switch colorType{
        case "red":
            view.backgroundColor = UIColor.red
        case "green":
            view.backgroundColor = UIColor.green
        case "blue":
            view.backgroundColor = UIColor.blue
        case "cyan":
            view.backgroundColor = UIColor.cyan
        default: break
        }
    }
    
    @IBAction func backToMain(_ segue:UIStoryboardSegue){
        print("back to main")
        if let svc  = segue.source as? SecondViewController{
            let selectedNumber = svc.myPickerView.selectedRow(inComponent: 0)
            let colorName = svc.colorArray[selectedNumber]
            print (colorName)
        }
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func gotNotification(notification:Notification){
        if let color = notification.userInfo?["color"] as? String{
            setColor(colorType: color)
        }
    }
    
    func gotAnotherNotif(notification:Notification){
        if let area = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue{
            print("Keyboard height = \(area.height)" )
        }
    }
}
