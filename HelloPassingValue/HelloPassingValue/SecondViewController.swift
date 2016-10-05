//
//  SecondViewController.swift
//  HelloPassingValue
//
//  Created by denny on 10/3/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate{
    func setColor(colorType:String)
}

class SecondViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myPickerView: UIPickerView!
    
    
    

    
    let colorArray = ["red", "green", "blue", "noAction"]
    var textFromFirstView:String?
    var chooseColor = ""
    
    var delegate:SecondViewControllerDelegate?
    @IBAction func goBack(_ sender: UIButton) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParentViewController{
            let i = myPickerView.selectedRow(inComponent: 0)
            let chooseColor = colorArray[i]
            delegate?.setColor(colorType: chooseColor)
        }
    }
    
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chooseColor = colorArray[row]
    }
    
}
