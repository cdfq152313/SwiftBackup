//
//  ViewController3.swift
//  ScrollViewAndTableViewTest
//
//  Created by Denny on 11/11/2016.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let page = 2
        scrollView.contentSize = CGSize(width: scrollView.frame.width*CGFloat(page), height: scrollView.frame.height)
        for i in 1...page {
            let image = UIImage(named: "pic\(i)")
            let imageView = UIImageView(image: image)
            let point  = CGPoint(x:self.scrollView.frame.width * CGFloat(i-1), y:0)
            imageView.frame = CGRect(origin:point, size:self.scrollView.frame.size)
            scrollView.addSubview(imageView)
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

