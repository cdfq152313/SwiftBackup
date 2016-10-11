//
//  ViewController.swift
//  HelloPlayAudio
//
//  Created by denny on 10/6/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var myPlayer:AVAudioPlayer?
    
    @IBAction func PlaySound(_ sender: UIButton) {
        myPlayer?.stop() // 停止
        myPlayer?.currentTime = 0 // 把音檔時間歸零
        myPlayer?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myPlayer = myPlayerInit()
    }
    
    func myPlayerInit()->AVAudioPlayer?{
        guard let path = Bundle.main.path(forResource: "Right", ofType:"mp3") else{
            return nil
        }
        
        let audioURL = URL(fileURLWithPath: path)
        do{
            return try AVAudioPlayer(contentsOf: audioURL)
        }
        catch{
            print("AVAudio Player Init failed")
            return nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

