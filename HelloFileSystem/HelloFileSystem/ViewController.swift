//
//  ViewController.swift
//  HelloFileSystem
//
//  Created by denny on 10/11/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!

    @IBAction func save(_ sender: AnyObject) {
        saveString()
        saveArray()
        saveDict()
        saveImage()
        createDirectory()
    }
    @IBAction func load(_ sender: AnyObject) {
        loadString()
        loadArray()
        loadDict()
        loadImage()
        listTemp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print()
        printDocumentURL()
        printCachesURL()
        printTempDirectory()
    }
    
    func printDocumentURL(){
        let path = NSHomeDirectory() + "/Document"
        let urlfrompath = URL(fileURLWithPath: path)
        
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        print("Document")
        print("path: \(path)")
        print("urlfrompath: \(urlfrompath)")
        print("url: \(url)")
        print()
    }
    
    func printCachesURL(){
        let path = NSHomeDirectory() + "/Library/Caches"
        let urlfrompath = URL(fileURLWithPath: path)
        
        let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        
        print("Caches")
        print("path: \(path)")
        print("urlfrompath: \(urlfrompath)")
        print("url: \(url)")
        print()
    }
    
    func printTempDirectory(){
        let pathFromNSHome = NSHomeDirectory() + "/tmp"
        
        let pathFromLibrary = NSTemporaryDirectory()
        
        print("Temps")
        print("pathFromNSHome: \(pathFromNSHome)")
        print("pathFromLibrary: \(pathFromLibrary)")
        print()
    }
    
    func saveString(){
        let text = "Hello World"
        let filePath = NSTemporaryDirectory() + "Text.txt"
        do{
            try text.write(toFile: filePath, atomically: true, encoding: .utf8)
        }catch{
            print("Not save correctly")
        }
    }
    
    func loadString(){
        let filePath = NSTemporaryDirectory() + "Text.txt"
        do{
            let loading = try NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8.rawValue)
            print(loading)
        }catch{
            print("No save file")
        }
    }
    
    func saveArray(){
        let originalArray = ["Apple", "Banana", "MAngo"]
        let arrayToSave = NSArray(array: originalArray)
        let filePath = NSTemporaryDirectory() + "saveArray.txt"
        arrayToSave.write(toFile: filePath, atomically: true)
    }
    
    func loadArray(){
        let filePath = NSTemporaryDirectory() + "saveArray.txt"
        if let loadArray = NSArray(contentsOfFile: filePath) as? [String]{
            print(loadArray)
        }
    }
    
    func saveDict(){
        let originalDict = ["1":"apple", "2":"banana", "3":"orange"]
        let dictToSave = NSDictionary(dictionary: originalDict)
        let filePath = NSTemporaryDirectory() + "saveDict.txt"
        dictToSave.write(toFile: filePath, atomically: true)
    }
    
    func loadDict(){
        let filePath = NSTemporaryDirectory() + "saveDict.txt"
        if let loadDict = NSDictionary(contentsOfFile: filePath) as? [String:String]{
            print(loadDict)
        }
    }
    
    func saveImage(){
        guard let image = UIImage(named: "Tails") else {
            print ("Cannot find image")
            return
        }
        
        if let dataToSave = UIImagePNGRepresentation(image){
            let filePath = NSTemporaryDirectory() + "savedImage.png"
            let fileURL = URL(fileURLWithPath: filePath)
            
            do{
                try dataToSave.write(to: fileURL)
            }catch{
                print("Can not save Image")
            }
        }
    }
    
    func loadImage(){
        let filePath = NSTemporaryDirectory() + "savedImage.png"
        let image = UIImage(contentsOfFile: filePath)
        myImageView.image = image
    }
    
    func createDirectory(){
        let directoryPath = NSTemporaryDirectory() + "/images"
        do{
            try FileManager.default.createDirectory(atPath: directoryPath, withIntermediateDirectories: true, attributes: nil)
        }catch{
            print("Cannot create directory")
        }
    }
    
    func listTemp(){
        print()
        print("List files in Temp Directory")
        let tempPath = NSTemporaryDirectory()
        do{
            let fileList = try FileManager.default.contentsOfDirectory(atPath: tempPath)
            for file in fileList{
                print(file)
            }
            print()
        }
        catch{
            print("Cannot list directory")
        }
    }
    
    func checkOutPath(){
        let path = NSTemporaryDirectory() + "/images"
        var isDirectory:ObjCBool = false
        let isExist = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        if isExist == true && isDirectory.boolValue == true{
            print("File exist and it is a direcotry")
        }
        else if isExist == true && isDirectory.boolValue == false{
            print("File exist but it is not a direcotry")
        }
        else{
            print("File isn't exist")
        }
    }
    
    func moveOrCopy(){
        let path = NSTemporaryDirectory() + "saveArray.txt"
        let cpPath = NSHomeDirectory() + "/Documents/ArrayBackup.txt"
        let mvPath = NSHomeDirectory() + "/Documents/saveArray.txt"
        
        do{
            try FileManager.default.copyItem(atPath: path, toPath: cpPath)
            try FileManager.default.moveItem(atPath: path, toPath: mvPath)
        }
        catch{
            print("Cannot copy file")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

