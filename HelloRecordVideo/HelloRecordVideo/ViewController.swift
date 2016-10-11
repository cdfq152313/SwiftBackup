//
//  ViewController.swift
//  HelloRecordVideo
//
//  Created by denny on 10/7/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit
import Photos
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction func recordVideo(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else{
            print("Cannot use camera")
            return
        }
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeMovie as String]
        
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let url = info[UIImagePickerControllerMediaURL] as? URL else {
            print("Cannot get record url")
            return
        }
        
        PHPhotoLibrary.shared().performChanges(
            {PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: url) },
            completionHandler: nil
        )
        
        dismiss(animated: true, completion: nil)
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

