//
//  SignViewController.swift
//  MovieApp
//
//  Created by denny on 10/7/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class SignViewController: UIViewController {
    let signKey = "sign"
    var signArray = [String]()
    
    @IBOutlet weak var warningMsg: UILabel!
    
    
    @IBOutlet weak var signText: UITextField!
    
    @IBOutlet weak var signDisplay: UITextView!

    @IBAction func signAction(_ sender: UIButton) {
        guard let sign = signText.text else{
            return
        }
        
        if sign == "" {
            warningMsg.text = "簽名不能留白"
            return
        }
        else{
            addSign(sign)
            signText.text = ""
        }
    }
    func addSign(_ sign:String){
        if signArray.count < 3 {
            signArray.append(sign)
            updateDisplay()
            warningMsg.text = ""
        }
        else{
            warningMsg.text = "只能簽三筆"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // signInit()
    }
    
    func updateDisplay(){
        var text = ""
        for str in signArray{
            text += str
            text += "\n"
        }
        signDisplay.text = text
    }
    
    func signInit(){
        if let loaded = UserDefaults.standard.object(forKey: signKey) as? [String]{
            signArray = loaded
            updateDisplay()
        }
        else{
            signArray = [String]()
        }
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
