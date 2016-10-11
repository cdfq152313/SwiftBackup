//
//  ViewController.swift
//  HelloMediaPlayer
//
//  Created by denny on 10/6/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate {
    
    @IBAction func pickMusic(_ sender: UIButton) {
        let mediaPicker = MPMediaPickerController(mediaTypes: .anyAudio)
        mediaPicker.delegate = self
        
        present(mediaPicker, animated: true, completion: nil)
    }
    
    @IBAction func stopMusic(_ sender: UIButton) {
        musicPlayer?.stop()
    }
    
    var musicPlayer:MPMusicPlayerController?
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        dismiss(animated: true, completion: nil)
    }
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        musicPlayer = MPMusicPlayerController.applicationMusicPlayer()
        musicPlayer?.setQueue(with:mediaItemCollection)
        musicPlayer?.play()
        dismiss(animated:true, completion: nil)
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

