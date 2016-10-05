//
//  ViewController.swift
//  HelloUIDatePicker
//
//  Created by denny on 10/5/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func getTime(_ sender: UIButton) {
        let date = myDatePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        let dateStr = dateFormatter.string(from: date)
        timeLabel.text = dateStr
    }
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        let dateStr = dateFormatter.string(from: date)
        timeLabel.text = dateStr
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.getCurTime), userInfo: nil, repeats: true)
    }
    
    func getCurTime(){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        let dateStr = dateFormatter.string(from: date)
        timeLabel.text = dateStr
//        timer?.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

