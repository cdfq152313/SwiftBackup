//
//  NewViewController.swift
//  HelloWebview
//
//  Created by denny on 10/14/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class NewViewController: UIViewController {
    @IBAction func useSFController(_ sender: AnyObject) {
        if let url = URL(string:"http://www.books.com.tw"){
            let safariController = SFSafariViewController(url:url)
            present(safariController, animated:true, completion:nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let area = CGRect(x:0, y:0, width:view.bounds.width, height: view.bounds.height)
        let myWebView = WKWebView(frame: area)
        view.addSubview(myWebView)
        
        guard let url = URL(string: "http://tw.yahoo.com") else {
            return
        }
        let request = URLRequest(url: url)
        myWebView.load(request)
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
