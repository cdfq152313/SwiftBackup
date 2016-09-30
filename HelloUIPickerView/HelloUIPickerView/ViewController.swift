//
//  ViewController.swift
//  HelloUIPickerView
//
//  Created by Denny on 2016/9/29.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let numberArray = ["1","2","3"]
    let fruitArray = ["apple", "banana", "orange", "waterlemon"]
    // 選單有幾類的選項
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 某一類的選項有幾列
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return numberArray.count
        }
        else{
            return fruitArray.count
        }
    }
    
    // 回答要顯示的文字
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return numberArray[row]
        }
        else{
            return fruitArray[row]
        }
    }
    // 選到某一列會執行的方法
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            print(numberArray[row])
        }
        else{
            print(fruitArray[row])
        }
    }
}

