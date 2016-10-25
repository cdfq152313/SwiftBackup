//
//  ViewController.swift
//  PictureTest
//
//  Created by denny on 10/24/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imgURL:URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if imgURL != nil{
            loadImage(imgURL!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var imageView: UIImageView!
    
    func loadImage(_ imgURL:URL){
        print(imgURL.path)
        let image = UIImage(contentsOfFile: imgURL.path)
        if image != nil{
            imageView.image = image
        }
        else{
            print("image is nil")
        }
        
    }
}

