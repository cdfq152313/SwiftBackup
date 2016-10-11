//
//  ViewController.swift
//  HelloRecordAudio
//
//  Created by denny on 10/6/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVAudioRecorderDelegate{
    
    var audioRecorder:AVAudioRecorder?
    var audioPlayer:AVAudioPlayer?
    var isRecording = false
    
    @IBAction func play(_ sender: UIButton) {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
        audioPlayer?.play()
    }
    
    @IBOutlet weak var play: UIButton!
    @IBAction func record(_ sender: UIButton) {
        if isRecording == false {
            recordAction()
        }
        else {
            stopRecordAction()
        }
    }
    
    func recordAction(){
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
        }
        catch{
            print("can't set audio session")
        }
        audioRecorder?.prepareToRecord()
        audioRecorder?.record()
    }
    
    func stopRecordAction(){
        let myAlert = UIAlertController(title:"Recoding", message: "Press OK to Stop", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler:{ (<#UIAlertAction#>) in
            self.audioRecorder?.stop()
            do{
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try AVAudioSession.sharedInstance().setActive(false)
            }
            catch{
                print("can't set audio session")
            }
            self.isRecording = false
        })
        
        myAlert.addAction(okAction)
        present(myAlert, animated:true, completion:nil)
    }
    
    func audioRecorderInit()->AVAudioRecorder?{
        let path = NSHomeDirectory() + "/Documents/user.wav"
        let url = URL(fileURLWithPath: path)
        
        let recordSettings:[String:Any] = [
            AVEncoderAudioQualityKey : AVAudioQuality.min.rawValue,
            AVEncoderBitRateKey: 16,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0
        ]
        do {
            let audioRecorder = try AVAudioRecorder(url: url, settings:recordSettings)
            audioRecorder.delegate = self
            return audioRecorder
        }
        catch{
            print("something is worng")
            return nil
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag == true{
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: recorder.url)
            }
            catch{
                print("something is Wrong...")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioRecorder = audioRecorderInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

