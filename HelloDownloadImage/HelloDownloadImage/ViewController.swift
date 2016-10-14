//
//  ViewController.swift
//  HelloDownloadImage
//
//  Created by denny on 10/14/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!
    var session:URLSession?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let url = URL(string: "http://pics.ctitv.com/wpimg/2016/10/210.jpg"){
            let area = CGRect(x:0, y:40, width:300, height:300)
            let imageView = DownloadImageView(frame: area)
            imageView.loadImagewithURL(url: url)
            self.view.addSubview(imageView)
        }
        downloadUseSession()
        //DispatchQueue.global().async {
        //    self.download()
        //}
    }
    
    func downloadUseSession(){
        session = URLSession(configuration: .default)
        if let url = URL(string: "http://www.carlosicaza.com/wp-content/uploads/2014/07/Swift-logo.png"){
            let downloadImageTask = session?.dataTask(with: url, completionHandler: {
                (data, urlResponse, error) in
                guard error == nil else{
                    return
                }
                if let okData = data{
                    let image = UIImage(data:okData)
                    DispatchQueue.main.async{
                        self.myImage.image = image
                    }
                }
            })
            downloadImageTask?.resume()
        }
    }
    
    func download(){
        if let url = URL(string: "http://www.carlosicaza.com/wp-content/uploads/2014/07/Swift-logo.png"){
            do {
                let data = try Data(contentsOf:url)
                let image = UIImage(data:data)
                DispatchQueue.main.async{
                    self.myImage.image = image
                }
            }
            catch{
                print("Cannot download image")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

