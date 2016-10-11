//
//  ViewController.swift
//  HelloPlayVideo
//
//  Created by denny on 10/7/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    var videoPlayer:AVPlayer?
    
    @IBAction func playVideo(_ sender: UIButton) {
        guard let path = Bundle.main.url(forResource: "HipHop", withExtension: "mp4") else {
            print("getPath error")
            return
        }
        
        videoPlayer = AVPlayer(url: path)
        let videoPlayerController = AVPlayerViewController()
        videoPlayerController.player = videoPlayer
        present(videoPlayerController, animated: true, completion: nil)
        videoPlayer?.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.playerDidReachEnd(notification:)), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    func playerDidReachEnd(notification:Notification){
        videoPlayer?.currentItem?.seek(to: kCMTimeZero)
        videoPlayer?.play()
    }
    
    func videoPlayerInit(){
        
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

