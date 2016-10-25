//
//  ViewController.swift
//  PictureTest
//
//  Created by denny on 10/24/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click(_ sender: AnyObject) {
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = .camera
//        imagePicker.delegate = self
//        self.present(imagePicker, animated: true, completion: nil)
        fakeAddImage()
    }
    @IBOutlet weak var imageView: UIImageView!
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("info \(info)")
        let image = info[UIImagePickerControllerOriginalImage]
        self.imageView.image = image as? UIImage
        self.dismiss(animated:true, completion: nil)
    }

    
    func fakeAddImage(){
        let imageName = String(format:"%f", Date.timeIntervalSinceReferenceDate) + ".jpg"
        var imagePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        imagePath.appendPathComponent(imageName)
        let text = "test"
        do {
            try text.write(to: imagePath, atomically: true, encoding: .utf8)
            recordSaveImage(imgName: imageName)
        }
        catch{
            print("Error")
        }
    }
    func recordSaveImage(imgName:String){
        let recordFile = "myRecord.txt"
        var fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        fileURL.appendPathComponent(recordFile)
        
        if var loadArray = NSArray(contentsOf: fileURL) as? [String]{
            loadArray.append(imgName)
            let arrayToSave = NSArray(array: loadArray)
            arrayToSave.write(to: fileURL, atomically: true)
            print(arrayToSave)
        }
        else{
            let array = [imgName]
            let arrayToSave = NSArray(array: array)
            arrayToSave.write(to: fileURL, atomically: true)
            print(arrayToSave)
        }
    }
}

