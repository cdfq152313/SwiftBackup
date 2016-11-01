//
//  ViewController.swift
//  WriteObjectTest
//
//  Created by denny on 10/31/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func write(_ sender: AnyObject) {
        let item = Item(name: "危城", detail: "動作")
        let data = NSKeyedArchiver.archivedData(withRootObject: item)
        let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = docUrl.appendingPathComponent("myfile.txt")
        try! data.write(to: url)
    }
    
    @IBAction func read(_ sender: AnyObject) {
        let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = docUrl.appendingPathComponent("myfile.txt")
        let data = try? Data(contentsOf: url)

        if let data = data {
            let item = NSKeyedUnarchiver.unarchiveObject(with: data) as! Item
            print("=== Read ===")
            print(item.name)
            print(item.detail)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

