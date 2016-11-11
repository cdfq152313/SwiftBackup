//
//  ViewController2.swift
//  ScrollViewAndTableViewTest
//
//  Created by Denny on 11/11/2016.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UIScrollViewDelegate{
    @IBOutlet weak var scrollView: UIScrollView!
    var imageView:UIImageView?
    @IBAction func zoomAction(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            let cgRect = CGRect(x: 300, y: 300, width: 200, height: 200)
            self.scrollView.zoom(to: cgRect, animated: true)
        })
    }
    
    @IBAction func myAction(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            self.scrollView.contentOffset = CGPoint(x: 100, y: 100)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("H : \(self.view.frame.size.height), W:\(self.view.frame.size.width)")
        scrollView.contentSize = CGSize(width: 500, height: 500)
        imageView = UIImageView(image:#imageLiteral(resourceName: "pic1"))
        scrollView.addSubview(imageView!)
        scrollView.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
