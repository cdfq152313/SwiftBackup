//
//  SecondViewController.swift
//  HelloPassingValue
//
//  Created by denny on 10/3/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class SecondViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myPickerView: UIPickerView!
    
    @IBAction func goBack(_ sender: UIButton) {
        
    }
    
    let colorArray = ["red", "green", "blue"]
    var textFromFirstView:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerView.dataSource = self
        myPickerView.delegate = self
        if let textToShow = textFromFirstView{
            myLabel.text = textToShow
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorArray[row]
    }
    
}
