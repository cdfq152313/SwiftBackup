//
//  HelloDownloadImageView.swift
//  HelloDownloadImage
//
//  Created by denny on 10/14/16.
//  Copyright © 2016 denny. All rights reserved.
//

import Foundation
import UIKit
class DownloadImageView: UIImageView{
    lazy var session:URLSession = {
        return URLSession(configuration: .default)
    }()
    
    var loading:UIActivityIndicatorView?
    
    override init(frame:CGRect){
        
        let area = CGRect(x: frame.size.width/2, y: frame.size.height/2, width:37, height:37)
        loading = UIActivityIndicatorView(frame: area)
        loading?.color = UIColor.blue
        loading?.hidesWhenStopped = true
        loading?.activityIndicatorViewStyle = .whiteLarge
        
        loading?.startAnimating()
        super.init(frame: frame)
        if loading != nil{
            self.addSubview(loading!)
        }
        
    }
    
    // for story board
    required init?(coder aDecoder: NSCoder){
        super.init(coder:aDecoder)
    }
    
    func loadImagewithURL(url:URL){
        self.image = nil
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if error != nil{
                return
            }
            
            if let loadedData = data{
                let loadedImage = UIImage(data: loadedData)
                DispatchQueue.main.async{
                    self.image = loadedImage
                    self.loading?.stopAnimating()
                }
            }
            
        }
        task.resume()
    }
}
